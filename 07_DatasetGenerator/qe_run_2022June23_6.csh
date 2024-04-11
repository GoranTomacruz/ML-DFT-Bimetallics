#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SCF-6##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June23files.6.out     ##CHANGE
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
mpirun -np 37 pw.x -i Cd2Au2.in > Cd2Au2.out &&
mpirun -np 37 pw.x -i Cr2Au2.in > Cr2Au2.out &&
mpirun -np 37 pw.x -i Cr2Cd2.in > Cr2Cd2.out &&
mpirun -np 37 pw.x -i Cr2Mo2.in > Cr2Mo2.out &&
mpirun -np 37 pw.x -i Cr2Rh2.in > Cr2Rh2.out &&
mpirun -np 37 pw.x -i Cr2Zn2.in > Cr2Zn2.out &&
mpirun -np 37 pw.x -i Cr2Zr2.in > Cr2Zr2.out &&
mpirun -np 37 pw.x -i Mo2Au2.in > Mo2Au2.out &&
mpirun -np 37 pw.x -i Mo2Cd2.in > Mo2Cd2.out &&
mpirun -np 37 pw.x -i Mo2Rh2.in > Mo2Rh2.out &&
mpirun -np 37 pw.x -i Rh2Au2.in > Rh2Au2.out &&
mpirun -np 37 pw.x -i Rh2Cd2.in > Rh2Cd2.out &&
mpirun -np 37 pw.x -i Sc2Au2.in > Sc2Au2.out &&
mpirun -np 37 pw.x -i Sc2Cd2.in > Sc2Cd2.out &&
mpirun -np 37 pw.x -i Sc2Cr2.in > Sc2Cr2.out &&
mpirun -np 37 pw.x -i Sc2Mo2.in > Sc2Mo2.out &&
mpirun -np 37 pw.x -i Sc2Rh2.in > Sc2Rh2.out &&
mpirun -np 37 pw.x -i Sc2Zn2.in > Sc2Zn2.out &&
mpirun -np 37 pw.x -i Sc2Zr2.in > Sc2Zr2.out &&
mpirun -np 37 pw.x -i Zn2Au2.in > Zn2Au2.out &&
mpirun -np 37 pw.x -i Zn2Cd2.in > Zn2Cd2.out &&
mpirun -np 37 pw.x -i Zn2Mo2.in > Zn2Mo2.out &&
mpirun -np 37 pw.x -i Zn2Rh2.in > Zn2Rh2.out &&
mpirun -np 37 pw.x -i Zr2Au2.in > Zr2Au2.out &&
mpirun -np 37 pw.x -i Zr2Cd2.in > Zr2Cd2.out &&
mpirun -np 37 pw.x -i Zr2Mo2.in > Zr2Mo2.out &&
mpirun -np 37 pw.x -i Zr2Rh2.in > Zr2Rh2.out
