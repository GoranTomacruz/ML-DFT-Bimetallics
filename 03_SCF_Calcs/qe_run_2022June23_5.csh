#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SCF-5##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June23files.5.out     ##CHANGE
#SBATCH --mail-user=jttomacruz@up.edu.ph    ##CHANGE
#SBATCH --mail-type=ALL
#SBATCH --requeue

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "SLURMTMPDIR="$SLURMTMPDIR
echo "working directory = "$SLURM_SUBMIT_DIR

module load openblas/0.3.9
module load fftw/3.3.8
module load qe/6.6_openmpi-4.0.3

ulimit -s unlimited

export OMP_NUM_THREADS=1

##cd to working directory
mpirun -np 37 pw.x -i Au2Hg2.in > Au2Hg2.out &&
mpirun -np 37 pw.x -i Cd2Hg2.in > Cd2Hg2.out &&
mpirun -np 37 pw.x -i Cd2Os2.in > Cd2Os2.out &&
mpirun -np 37 pw.x -i Cd2Y2.in > Cd2Y2.out &&
mpirun -np 37 pw.x -i Cr2Hg2.in > Cr2Hg2.out &&
mpirun -np 37 pw.x -i Cr2Nb2.in > Cr2Nb2.out &&
mpirun -np 37 pw.x -i Cr2Os2.in > Cr2Os2.out &&
mpirun -np 37 pw.x -i Cr2Y2.in > Cr2Y2.out &&
mpirun -np 37 pw.x -i Mo2Hg2.in > Mo2Hg2.out &&
mpirun -np 37 pw.x -i Mo2Os2.in > Mo2Os2.out &&
mpirun -np 37 pw.x -i Mo2Y2.in > Mo2Y2.out &&
mpirun -np 37 pw.x -i Nb2Au2.in > Nb2Au2.out &&
mpirun -np 37 pw.x -i Nb2Cd2.in > Nb2Cd2.out &&
mpirun -np 37 pw.x -i Nb2Hg2.in > Nb2Hg2.out &&
mpirun -np 37 pw.x -i Nb2Mo2.in > Nb2Mo2.out &&
mpirun -np 37 pw.x -i Nb2Os2.in > Nb2Os2.out &&
mpirun -np 37 pw.x -i Nb2Rh2.in > Nb2Rh2.out &&
mpirun -np 37 pw.x -i Nb2Y2.in > Nb2Y2.out &&
mpirun -np 37 pw.x -i Os2Au2.in > Os2Au2.out &&
mpirun -np 37 pw.x -i Os2Hg2.in > Os2Hg2.out &&
mpirun -np 37 pw.x -i Rh2Hg2.in > Rh2Hg2.out &&
mpirun -np 37 pw.x -i Rh2Os2.in > Rh2Os2.out &&
mpirun -np 37 pw.x -i Rh2Y2.in > Rh2Y2.out &&
mpirun -np 37 pw.x -i Sc2Hg2.in > Sc2Hg2.out &&
mpirun -np 37 pw.x -i Sc2Nb2.in > Sc2Nb2.out &&
mpirun -np 37 pw.x -i Sc2Os2.in > Sc2Os2.out &&
mpirun -np 37 pw.x -i Sc2Y2.in > Sc2Y2.out &&
mpirun -np 37 pw.x -i Y2Au2.in > Y2Au2.out &&
mpirun -np 37 pw.x -i Y2Hg2.in > Y2Hg2.out &&
mpirun -np 37 pw.x -i Y2Os2.in > Y2Os2.out &&
mpirun -np 37 pw.x -i Zn2Hg2.in > Zn2Hg2.out &&
mpirun -np 37 pw.x -i Zn2Nb2.in > Zn2Nb2.out &&
mpirun -np 37 pw.x -i Zn2Os2.in > Zn2Os2.out &&
mpirun -np 37 pw.x -i Zn2Y2.in > Zn2Y2.out &&
mpirun -np 37 pw.x -i Zr2Hg2.in > Zr2Hg2.out &&
mpirun -np 37 pw.x -i Zr2Nb2.in > Zr2Nb2.out &&
mpirun -np 37 pw.x -i Zr2Os2.in > Zr2Os2.out &&
mpirun -np 37 pw.x -i Zr2Y2.in > Zr2Y2.out
