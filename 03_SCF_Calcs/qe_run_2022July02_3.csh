#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SCF-3##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July02files.3.out     ##CHANGE
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
mpirun -np 37 pw.x -i Ag2Pt2.in > Ag2Pt2.out &&
mpirun -np 37 pw.x -i Ag2Re2.in > Ag2Re2.out &&
mpirun -np 37 pw.x -i Cd2Pt2.in > Cd2Pt2.out &&
mpirun -np 37 pw.x -i Cd2Re2.in > Cd2Re2.out &&
mpirun -np 37 pw.x -i Cr2Pt2.in > Cr2Pt2.out &&
mpirun -np 37 pw.x -i Cr2Re2.in > Cr2Re2.out &&
mpirun -np 37 pw.x -i Cu2Pt2.in > Cu2Pt2.out &&
mpirun -np 37 pw.x -i Cu2Re2.in > Cu2Re2.out &&
mpirun -np 37 pw.x -i Mo2Pt2.in > Mo2Pt2.out &&
mpirun -np 37 pw.x -i Mo2Re2.in > Mo2Re2.out &&
mpirun -np 37 pw.x -i Nb2Pt2.in > Nb2Pt2.out &&
mpirun -np 37 pw.x -i Nb2Re2.in > Nb2Re2.out &&
mpirun -np 37 pw.x -i Os2Pt2.in > Os2Pt2.out &&
mpirun -np 37 pw.x -i Pt2Au2.in > Pt2Au2.out &&
mpirun -np 37 pw.x -i Pt2Hg2.in > Pt2Hg2.out &&
mpirun -np 37 pw.x -i Re2Au2.in > Re2Au2.out &&
mpirun -np 37 pw.x -i Re2Hg2.in > Re2Hg2.out &&
mpirun -np 37 pw.x -i Re2Os2.in > Re2Os2.out &&
mpirun -np 37 pw.x -i Re2Pt2.in > Re2Pt2.out &&
mpirun -np 37 pw.x -i Rh2Pt2.in > Rh2Pt2.out &&
mpirun -np 37 pw.x -i Rh2Re2.in > Rh2Re2.out &&
mpirun -np 37 pw.x -i Ru2Pt2.in > Ru2Pt2.out &&
mpirun -np 37 pw.x -i Ru2Re2.in > Ru2Re2.out &&
mpirun -np 37 pw.x -i Sc2Pt2.in > Sc2Pt2.out &&
mpirun -np 37 pw.x -i Sc2Re2.in > Sc2Re2.out &&
mpirun -np 37 pw.x -i Sc2Ti2.in > Sc2Ti2.out &&
mpirun -np 37 pw.x -i Ti2Ag2.in > Ti2Ag2.out &&
mpirun -np 37 pw.x -i Ti2Au2.in > Ti2Au2.out &&
mpirun -np 37 pw.x -i Ti2Cd2.in > Ti2Cd2.out &&
mpirun -np 37 pw.x -i Ti2Cr2.in > Ti2Cr2.out &&
mpirun -np 37 pw.x -i Ti2Cu2.in > Ti2Cu2.out &&
mpirun -np 37 pw.x -i Ti2Hg2.in > Ti2Hg2.out &&
mpirun -np 37 pw.x -i Ti2Mo2.in > Ti2Mo2.out &&
mpirun -np 37 pw.x -i Ti2Nb2.in > Ti2Nb2.out &&
mpirun -np 37 pw.x -i Ti2Os2.in > Ti2Os2.out &&
mpirun -np 37 pw.x -i Ti2Pt2.in > Ti2Pt2.out &&
mpirun -np 37 pw.x -i Ti2Re2.in > Ti2Re2.out &&
mpirun -np 37 pw.x -i Ti2Rh2.in > Ti2Rh2.out &&
mpirun -np 37 pw.x -i Ti2Ru2.in > Ti2Ru2.out &&
mpirun -np 37 pw.x -i Ti2Y2.in > Ti2Y2.out &&
mpirun -np 37 pw.x -i Ti2Zn2.in > Ti2Zn2.out &&
mpirun -np 37 pw.x -i Ti2Zr2.in > Ti2Zr2.out &&
mpirun -np 37 pw.x -i Y2Pt2.in > Y2Pt2.out &&
mpirun -np 37 pw.x -i Y2Re2.in > Y2Re2.out &&
mpirun -np 37 pw.x -i Zn2Pt2.in > Zn2Pt2.out &&
mpirun -np 37 pw.x -i Zn2Re2.in > Zn2Re2.out &&
mpirun -np 37 pw.x -i Zr2Pt2.in > Zr2Pt2.out &&
mpirun -np 37 pw.x -i Zr2Re2.in > Zr2Re2.out
