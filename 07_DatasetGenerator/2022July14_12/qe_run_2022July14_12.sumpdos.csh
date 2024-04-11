#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-12##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July14files.12.out     ##CHANGE
#SBATCH --error=2022July14files.12.err     ##CHANGE
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
STR="Co2Fe2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Fe2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Fe2.pdos.out.pdos_atm#11\\(Fe\\)*\(d\) Co2Fe2.pdos.out.pdos_atm#12\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Fe2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Co2Fe2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Fe2.pdos.out.pdos_atm#11\\(Fe\\)*\(d\) Co2Fe2.pdos.out.pdos_atm#12\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Fe2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Fe2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#12\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Fe2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Cr2Fe2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#12\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Fe2_bridge-A_B-B_\(d\).dat`"
echo $STR

STR="Cr2Fe2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#11\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Fe2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Fe2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#12\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Fe2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cr2Fe2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#11\\(Fe\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#12\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Fe2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Fe2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#11\\(Fe\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#12\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Fe2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cr2Fe2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Fe2_top-A_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2La2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2La2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2La2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Fe2La2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Fe2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2La2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Fe2La2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2La2_top-A_\(d\).dat`"
echo $STR

STR="Fe2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2La2_top-B_\(d\).dat`"
echo $STR

STR="Fe2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Fe2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2La2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Fe2La2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2La2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2La2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Fe2La2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Fe2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2La2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Fe2La2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2La2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Fe2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2La2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

