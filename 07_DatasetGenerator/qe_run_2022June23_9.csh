#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SCF-9##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June23files.9.out     ##CHANGE
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
mpirun -np 37 pw.x -i Cr2Ni2.in > Cr2Ni2.out &&
mpirun -np 37 pw.x -i Ni2Ag2.in > Ni2Ag2.out &&
mpirun -np 37 pw.x -i Ni2Au2.in > Ni2Au2.out &&
mpirun -np 37 pw.x -i Ni2Cd2.in > Ni2Cd2.out &&
mpirun -np 37 pw.x -i Ni2Cu2.in > Ni2Cu2.out &&
mpirun -np 37 pw.x -i Ni2Hf2.in > Ni2Hf2.out &&
mpirun -np 37 pw.x -i Ni2Hg2.in > Ni2Hg2.out &&
mpirun -np 37 pw.x -i Ni2Ir2.in > Ni2Ir2.out &&
mpirun -np 37 pw.x -i Ni2La2.in > Ni2La2.out &&
mpirun -np 37 pw.x -i Ni2Mo2.in > Ni2Mo2.out &&
mpirun -np 37 pw.x -i Ni2Nb2.in > Ni2Nb2.out &&
mpirun -np 37 pw.x -i Ni2Os2.in > Ni2Os2.out &&
mpirun -np 37 pw.x -i Ni2Pd2.in > Ni2Pd2.out &&
mpirun -np 37 pw.x -i Ni2Pt2.in > Ni2Pt2.out &&
mpirun -np 37 pw.x -i Ni2Re2.in > Ni2Re2.out &&
mpirun -np 37 pw.x -i Ni2Rh2.in > Ni2Rh2.out &&
mpirun -np 37 pw.x -i Ni2Ru2.in > Ni2Ru2.out &&
mpirun -np 37 pw.x -i Ni2Ta2.in > Ni2Ta2.out &&
mpirun -np 37 pw.x -i Ni2W2.in > Ni2W2.out &&
mpirun -np 37 pw.x -i Ni2Y2.in > Ni2Y2.out &&
mpirun -np 37 pw.x -i Ni2Zn2.in > Ni2Zn2.out &&
mpirun -np 37 pw.x -i Ni2Zr2.in > Ni2Zr2.out
