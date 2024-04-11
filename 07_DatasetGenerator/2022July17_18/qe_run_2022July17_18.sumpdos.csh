#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-18##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.18.out     ##CHANGE
#SBATCH --error=2022July17files.18.err     ##CHANGE
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
STR="Fe2Y2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2Y2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Fe2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Fe2Y2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Y2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Fe2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Zn2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Zr2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2Zr2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2Zr2.pdos.out.pdos_atm#7\\(Zr\\)*\(d\) Fe2Zr2.pdos.out.pdos_atm#8\\(Zr\\)*\(d\) Fe2Zr2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Zr2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Fe2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Zr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

