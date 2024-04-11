#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-15##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July14files.15.out     ##CHANGE
#SBATCH --error=2022July14files.15.err     ##CHANGE
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
STR="Fe2Ir2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ir2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Fe2Ir2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ir2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Fe2Ir2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Fe2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Fe2Ir2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Fe2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Fe2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ir2_top-B_\(d\).dat`"
echo $STR

STR="Fe2Ir2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ir2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Fe2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Fe2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Fe2Ir2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ir2_top-A_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Ni2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ni2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ni2.pdos.out.pdos_atm#11\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ni2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Fe2Ni2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ni2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ni2.pdos.out.pdos_atm#12\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ni2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Fe2Ni2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ni2.pdos.out.pdos_atm#11\\(Ni\\)*\(d\) Fe2Ni2.pdos.out.pdos_atm#12\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ni2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Fe2Ni2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ni2.pdos.out.pdos_atm#11\\(Ni\\)*\(d\) Fe2Ni2.pdos.out.pdos_atm#12\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ni2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Fe2Ni2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ni2_top-A_\(d\).dat`"
echo $STR

STR="Fe2Ni2.pdos.out.pdos_atm#11\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ni2_top-B_\(d\).dat`"
echo $STR

STR="Fe2Ni2.pdos.out.pdos_atm#11\\(Ni\\)*\(d\) Fe2Ni2.pdos.out.pdos_atm#12\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ni2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Os2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Os2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Os2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Fe2Os2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Os2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Os2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Fe2Os2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Fe2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Os2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Fe2Os2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Os2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Os2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Fe2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Fe2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Os2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Fe2Os2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Os2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Fe2Os2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Fe2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Os2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10
