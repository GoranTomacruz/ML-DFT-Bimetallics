#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-17##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.17.out     ##CHANGE
#SBATCH --error=2022July17files.17.err     ##CHANGE
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
module load anaconda/3-2021.11

ulimit -s unlimited

export OMP_NUM_THREADS=1

##cd to working directory
STR="Fe2Ru2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Ta2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Tc2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#7\\(Tc\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#8\\(Tc\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Tc2_two-layers_\(d\).dat`"
echo $STR

sleep 10

