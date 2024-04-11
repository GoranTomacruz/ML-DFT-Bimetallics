#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SCF-4##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July02files.4.out     ##CHANGE
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
mpirun -np 37 pw.x -i Ag2Au2.in > Ag2Au2.out &&
mpirun -np 37 pw.x -i Ag2Cd2.in > Ag2Cd2.out &&
mpirun -np 37 pw.x -i Ag2Hg2.in > Ag2Hg2.out &&
mpirun -np 37 pw.x -i Ag2Os2.in > Ag2Os2.out &&
mpirun -np 37 pw.x -i Ag2Y2.in > Ag2Y2.out &&
mpirun -np 37 pw.x -i Cr2Ag2.in > Cr2Ag2.out &&
mpirun -np 37 pw.x -i Cr2Cu2.in > Cr2Cu2.out &&
mpirun -np 37 pw.x -i Cr2Ru2.in > Cr2Ru2.out &&
mpirun -np 37 pw.x -i Cu2Ag2.in > Cu2Ag2.out &&
mpirun -np 37 pw.x -i Cu2Au2.in > Cu2Au2.out &&
mpirun -np 37 pw.x -i Cu2Cd2.in > Cu2Cd2.out &&
mpirun -np 37 pw.x -i Cu2Hg2.in > Cu2Hg2.out &&
mpirun -np 37 pw.x -i Cu2Mo2.in > Cu2Mo2.out &&
mpirun -np 37 pw.x -i Cu2Nb2.in > Cu2Nb2.out &&
mpirun -np 37 pw.x -i Cu2Os2.in > Cu2Os2.out &&
mpirun -np 37 pw.x -i Cu2Rh2.in > Cu2Rh2.out &&
mpirun -np 37 pw.x -i Cu2Ru2.in > Cu2Ru2.out &&
mpirun -np 37 pw.x -i Cu2Y2.in > Cu2Y2.out &&
mpirun -np 37 pw.x -i Cu2Zn2.in > Cu2Zn2.out &&
mpirun -np 37 pw.x -i Cu2Zr2.in > Cu2Zr2.out &&
mpirun -np 37 pw.x -i Mo2Ag2.in > Mo2Ag2.out &&
mpirun -np 37 pw.x -i Mo2Ru2.in > Mo2Ru2.out &&
mpirun -np 37 pw.x -i Nb2Ag2.in > Nb2Ag2.out &&
mpirun -np 37 pw.x -i Nb2Ru2.in > Nb2Ru2.out &&
mpirun -np 37 pw.x -i Rh2Ag2.in > Rh2Ag2.out &&
mpirun -np 37 pw.x -i Ru2Ag2.in > Ru2Ag2.out &&
mpirun -np 37 pw.x -i Ru2Au2.in > Ru2Au2.out &&
mpirun -np 37 pw.x -i Ru2Cd2.in > Ru2Cd2.out &&
mpirun -np 37 pw.x -i Ru2Hg2.in > Ru2Hg2.out &&
mpirun -np 37 pw.x -i Ru2Os2.in > Ru2Os2.out &&
mpirun -np 37 pw.x -i Ru2Rh2.in > Ru2Rh2.out &&
mpirun -np 37 pw.x -i Ru2Y2.in > Ru2Y2.out &&
mpirun -np 37 pw.x -i Sc2Ag2.in > Sc2Ag2.out &&
mpirun -np 37 pw.x -i Sc2Cu2.in > Sc2Cu2.out &&
mpirun -np 37 pw.x -i Sc2Ru2.in > Sc2Ru2.out &&
mpirun -np 37 pw.x -i Zn2Ag2.in > Zn2Ag2.out &&
mpirun -np 37 pw.x -i Zn2Ru2.in > Zn2Ru2.out &&
mpirun -np 37 pw.x -i Zr2Ag2.in > Zr2Ag2.out &&
mpirun -np 37 pw.x -i Zr2Ru2.in > Zr2Ru2.out
