#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=KCONV19m2 ##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=20           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022June15files.29.out     ##CHANGE
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
mpirun -np 20 pw.x -i Mn-19.in > Mn-19.out &&
mpirun -np 20 pw.x -i Ni-19.in > Ni-19.out 

