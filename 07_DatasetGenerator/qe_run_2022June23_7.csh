#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SCF-7##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June23files.7.out     ##CHANGE
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
mpirun -np 37 pw.x -i Ag2Hf2.in > Ag2Hf2.out &&
mpirun -np 37 pw.x -i Ag2Ta2.in > Ag2Ta2.out &&
mpirun -np 37 pw.x -i Cd2Hf2.in > Cd2Hf2.out &&
mpirun -np 37 pw.x -i Cd2Ta2.in > Cd2Ta2.out &&
mpirun -np 37 pw.x -i Cr2Hf2.in > Cr2Hf2.out &&
mpirun -np 37 pw.x -i Cr2Ta2.in > Cr2Ta2.out &&
mpirun -np 37 pw.x -i Cu2Hf2.in > Cu2Hf2.out &&
mpirun -np 37 pw.x -i Cu2Ta2.in > Cu2Ta2.out &&
mpirun -np 37 pw.x -i Hf2Au2.in > Hf2Au2.out &&
mpirun -np 37 pw.x -i Hf2Hg2.in > Hf2Hg2.out &&
mpirun -np 37 pw.x -i Hf2Ir2.in > Hf2Ir2.out &&
mpirun -np 37 pw.x -i Hf2Os2.in > Hf2Os2.out &&
mpirun -np 37 pw.x -i Hf2Pt2.in > Hf2Pt2.out &&
mpirun -np 37 pw.x -i Hf2Re2.in > Hf2Re2.out &&
mpirun -np 37 pw.x -i Hf2Ta2.in > Hf2Ta2.out &&
mpirun -np 37 pw.x -i Hf2W2.in > Hf2W2.out &&
mpirun -np 37 pw.x -i Hf2Y2.in > Hf2Y2.out &&
mpirun -np 37 pw.x -i Mo2Hf2.in > Mo2Hf2.out &&
mpirun -np 37 pw.x -i Mo2Ta2.in > Mo2Ta2.out &&
mpirun -np 37 pw.x -i Nb2Hf2.in > Nb2Hf2.out &&
mpirun -np 37 pw.x -i Nb2Ta2.in > Nb2Ta2.out &&
mpirun -np 37 pw.x -i Pd2Hf2.in > Pd2Hf2.out &&
mpirun -np 37 pw.x -i Pd2Ta2.in > Pd2Ta2.out &&
mpirun -np 37 pw.x -i Rh2Hf2.in > Rh2Hf2.out &&
mpirun -np 37 pw.x -i Rh2Ta2.in > Rh2Ta2.out &&
mpirun -np 37 pw.x -i Ru2Hf2.in > Ru2Hf2.out &&
mpirun -np 37 pw.x -i Ru2Ta2.in > Ru2Ta2.out &&
mpirun -np 37 pw.x -i Sc2Hf2.in > Sc2Hf2.out &&
mpirun -np 37 pw.x -i Sc2Ta2.in > Sc2Ta2.out &&
mpirun -np 37 pw.x -i Ta2Au2.in > Ta2Au2.out &&
mpirun -np 37 pw.x -i Ta2Hg2.in > Ta2Hg2.out &&
mpirun -np 37 pw.x -i Ta2Ir2.in > Ta2Ir2.out &&
mpirun -np 37 pw.x -i Ta2Os2.in > Ta2Os2.out &&
mpirun -np 37 pw.x -i Ta2Pt2.in > Ta2Pt2.out &&
mpirun -np 37 pw.x -i Ta2Re2.in > Ta2Re2.out &&
mpirun -np 37 pw.x -i Ta2W2.in > Ta2W2.out &&
mpirun -np 37 pw.x -i Tc2Hf2.in > Tc2Hf2.out &&
mpirun -np 37 pw.x -i Tc2Ta2.in > Tc2Ta2.out &&
mpirun -np 37 pw.x -i Ti2Hf2.in > Ti2Hf2.out &&
mpirun -np 37 pw.x -i Ti2Ta2.in > Ti2Ta2.out &&
mpirun -np 37 pw.x -i V2Hf2.in > V2Hf2.out &&
mpirun -np 37 pw.x -i V2Ta2.in > V2Ta2.out &&
mpirun -np 37 pw.x -i Y2Ta2.in > Y2Ta2.out &&
mpirun -np 37 pw.x -i Zn2Hf2.in > Zn2Hf2.out &&
mpirun -np 37 pw.x -i Zn2Ta2.in > Zn2Ta2.out &&
mpirun -np 37 pw.x -i Zr2Hf2.in > Zr2Hf2.out &&
mpirun -np 37 pw.x -i Zr2Ta2.in > Zr2Ta2.out
