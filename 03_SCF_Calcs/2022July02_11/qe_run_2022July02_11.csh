#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SCF-11##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July02files.11.out     ##CHANGE
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
mpirun -np 37 pw.x -i Co2Mn2.in > Co2Mn2.out &&
mpirun -np 37 pw.x -i Cr2Mn2.in > Cr2Mn2.out &&
mpirun -np 37 pw.x -i Mn2Ag2.in > Mn2Ag2.out &&
mpirun -np 37 pw.x -i Mn2Au2.in > Mn2Au2.out &&
mpirun -np 37 pw.x -i Mn2Cd2.in > Mn2Cd2.out &&
mpirun -np 37 pw.x -i Mn2Cu2.in > Mn2Cu2.out &&
mpirun -np 37 pw.x -i Mn2Hg2.in > Mn2Hg2.out &&
mpirun -np 37 pw.x -i Mn2Ir2.in > Mn2Ir2.out &&
mpirun -np 37 pw.x -i Mn2La2.in > Mn2La2.out &&
mpirun -np 37 pw.x -i Mn2Mo2.in > Mn2Mo2.out &&
mpirun -np 37 pw.x -i Mn2Nb2.in > Mn2Nb2.out &&
mpirun -np 37 pw.x -i Mn2Ni2.in > Mn2Ni2.out &&
mpirun -np 37 pw.x -i Mn2Pd2.in > Mn2Pd2.out &&
mpirun -np 37 pw.x -i Mn2Pt2.in > Mn2Pt2.out &&
mpirun -np 37 pw.x -i Mn2Re2.in > Mn2Re2.out &&
mpirun -np 37 pw.x -i Mn2Rh2.in > Mn2Rh2.out &&
mpirun -np 37 pw.x -i Mn2Ru2.in > Mn2Ru2.out &&
mpirun -np 37 pw.x -i Mn2Ta2.in > Mn2Ta2.out &&
mpirun -np 37 pw.x -i Mn2W2.in > Mn2W2.out &&
mpirun -np 37 pw.x -i Mn2Y2.in > Mn2Y2.out &&
mpirun -np 37 pw.x -i Mn2Zn2.in > Mn2Zn2.out &&
mpirun -np 37 pw.x -i Mn2Zr2.in > Mn2Zr2.out
