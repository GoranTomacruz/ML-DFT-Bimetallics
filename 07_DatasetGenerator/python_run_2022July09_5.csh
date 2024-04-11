#!/bin/bash 

#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-5##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July09files.5.out     ##CHANGE
#SBATCH --error=2022July09files.5.err 
#SBATCH --mail-user=jttomacruz@up.edu.ph    ##CHANGE
#SBATCH --mail-type=ALL
#SBATCH --requeue
 
echo "SLURM_JOBID="$SLURM_JOBID 
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST 
echo "SLURM_NNODES"=$SLURM_NNODES 
echo "SLURMTMPDIR="$SLURMTMPDIR 
echo "working directory = "$SLURM_SUBMIT_DIR 
 
# Place commands to load environment modules here 
module load anaconda/3-2021.11
 
# Set stack size to unlimited 
ulimit -s unlimited 

# Run python script
srun python3 pdos_solver.py
