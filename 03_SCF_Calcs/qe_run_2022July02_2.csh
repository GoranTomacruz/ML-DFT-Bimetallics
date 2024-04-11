#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SCF-2##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July02files.2.out     ##CHANGE
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
mpirun -np 37 pw.x -i Ag2Ir2.in > Ag2Ir2.out &&
mpirun -np 37 pw.x -i Cd2Ir2.in > Cd2Ir2.out &&
mpirun -np 37 pw.x -i Cr2Ir2.in > Cr2Ir2.out &&
mpirun -np 37 pw.x -i Cr2Tc2.in > Cr2Tc2.out &&
mpirun -np 37 pw.x -i Cu2Ir2.in > Cu2Ir2.out &&
mpirun -np 37 pw.x -i Cu2Tc2.in > Cu2Tc2.out &&
mpirun -np 37 pw.x -i Ir2Au2.in > Ir2Au2.out &&
mpirun -np 37 pw.x -i Ir2Hg2.in > Ir2Hg2.out &&
mpirun -np 37 pw.x -i Ir2Pt2.in > Ir2Pt2.out &&
mpirun -np 37 pw.x -i Mo2Ir2.in > Mo2Ir2.out &&
mpirun -np 37 pw.x -i Mo2Tc2.in > Mo2Tc2.out &&
mpirun -np 37 pw.x -i Nb2Ir2.in > Nb2Ir2.out &&
mpirun -np 37 pw.x -i Nb2Tc2.in > Nb2Tc2.out &&
mpirun -np 37 pw.x -i Os2Ir2.in > Os2Ir2.out &&
mpirun -np 37 pw.x -i Re2Ir2.in > Re2Ir2.out &&
mpirun -np 37 pw.x -i Rh2Ir2.in > Rh2Ir2.out &&
mpirun -np 37 pw.x -i Ru2Ir2.in > Ru2Ir2.out &&
mpirun -np 37 pw.x -i Sc2Ir2.in > Sc2Ir2.out &&
mpirun -np 37 pw.x -i Sc2Tc2.in > Sc2Tc2.out &&
mpirun -np 37 pw.x -i Tc2Ag2.in > Tc2Ag2.out &&
mpirun -np 37 pw.x -i Tc2Au2.in > Tc2Au2.out &&
mpirun -np 37 pw.x -i Tc2Cd2.in > Tc2Cd2.out &&
mpirun -np 37 pw.x -i Tc2Hg2.in > Tc2Hg2.out &&
mpirun -np 37 pw.x -i Tc2Ir2.in > Tc2Ir2.out &&
mpirun -np 37 pw.x -i Tc2Os2.in > Tc2Os2.out &&
mpirun -np 37 pw.x -i Tc2Pt2.in > Tc2Pt2.out &&
mpirun -np 37 pw.x -i Tc2Re2.in > Tc2Re2.out &&
mpirun -np 37 pw.x -i Tc2Rh2.in > Tc2Rh2.out &&
mpirun -np 37 pw.x -i Tc2Ru2.in > Tc2Ru2.out &&
mpirun -np 37 pw.x -i Tc2Y2.in > Tc2Y2.out &&
mpirun -np 37 pw.x -i Ti2Ir2.in > Ti2Ir2.out &&
mpirun -np 37 pw.x -i Ti2Tc2.in > Ti2Tc2.out &&
mpirun -np 37 pw.x -i Y2Ir2.in > Y2Ir2.out &&
mpirun -np 37 pw.x -i Zn2Ir2.in > Zn2Ir2.out &&
mpirun -np 37 pw.x -i Zn2Tc2.in > Zn2Tc2.out &&
mpirun -np 37 pw.x -i Zr2Ir2.in > Zr2Ir2.out &&
mpirun -np 37 pw.x -i Zr2Tc2.in > Zr2Tc2.out
