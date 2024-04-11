#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-17##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July14files.17.out     ##CHANGE
#SBATCH --error=2022July14files.17.err     ##CHANGE
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
STR="Fe2Ru2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ru2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Fe2Ru2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ru2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Fe2Ru2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ru2_top-A_\(d\).dat`"
echo $STR

STR="Fe2Ru2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ru2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Fe2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ru2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Fe2Ru2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ru2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Fe2Ru2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ru2_bridge-A_B-B_\(d\).dat`"
echo $STR

STR="Fe2Ru2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ru2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Fe2Ru2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Fe2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ru2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Ta2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Fe2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Fe2Ta2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Fe2Ta2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ta2_top-A_\(d\).dat`"
echo $STR

STR="Fe2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ta2_top-B_\(d\).dat`"
echo $STR

STR="Fe2Ta2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Fe2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ta2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Tc2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Tc2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Fe2Tc2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Tc2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Fe2Tc2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Tc2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Fe2Tc2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Tc2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Fe2Tc2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Fe2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Tc2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

