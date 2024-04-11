#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-07##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July14files.07.out     ##CHANGE
#SBATCH --error=2022July14files.07.err     ##CHANGE
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
STR="Ag2Hf2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ag2Hf2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ag2Hf2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ag2Hf2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hf2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ag2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hf2_top-B_\(d\).dat`"
echo $STR

STR="Ag2Hf2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hf2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ag2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hf2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ag2Hf2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hf2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Ag2Hf2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ag2Ta2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ag2Ta2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ag2Ta2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ag2Ta2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ag2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ag2Ta2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ag2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ta2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Cd2Hf2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cd2Hf2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cd2Hf2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cd2Hf2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Hf2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cd2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Hf2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cd2Hf2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Cd2Ta2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cd2Ta2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cd2Ta2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cd2Ta2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cd2Ta2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ta2_top-B_\(d\).dat`"
echo $STR

STR="Cd2Ta2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ta2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Hf2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Hf2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cr2Hf2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Hf2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cr2Hf2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Hf2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Cr2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Hf2_top-B_\(d\).dat`"
echo $STR

STR="Cr2Hf2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Ta2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ta2_top-A_\(d\).dat`"
echo $STR

STR="Cr2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ta2_top-B_\(d\).dat`"
echo $STR

STR="Cr2Ta2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cr2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cr2Ta2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cr2Ta2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Ta2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hf2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cu2Hf2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Hf2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hf2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Hf2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hf2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Cu2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hf2_top-B_\(d\).dat`"
echo $STR

STR="Cu2Hf2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hf2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Ta2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cu2Ta2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Ta2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ta2_top-B_\(d\).dat`"
echo $STR

STR="Cu2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cu2Ta2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Ta2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Au2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Au2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Hf2Au2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Au2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Hf2Au2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Au2_top-B_\(d\).dat`"
echo $STR

STR="Hf2Au2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Au2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Hf2Au2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Au2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Hg2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hf2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Hg2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Hf2Hg2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hf2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Hg2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Hf2Hg2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Hg2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Hg2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Hf2Hg2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Hg2_top-A_\(d\).dat`"
echo $STR

STR="Hf2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Hg2_top-B_\(d\).dat`"
echo $STR

STR="Hf2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hf2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Hg2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Ir2_top-B_\(d\).dat`"
echo $STR

STR="Hf2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Hf2Ir2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Hf2Ir2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Ir2_top-A_\(d\).dat`"
echo $STR

STR="Hf2Ir2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Hf2Ir2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Os2_top-B_\(d\).dat`"
echo $STR

STR="Hf2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Os2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Hf2Os2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Os2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Hf2Os2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Os2_top-A_\(d\).dat`"
echo $STR

STR="Hf2Os2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Os2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Hf2Os2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Os2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Hf2Os2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Os2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Pt2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Pt2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Hf2Pt2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Pt2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Hf2Pt2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Pt2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Hf2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Pt2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Hf2Pt2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Pt2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Hf2Pt2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Pt2_top-A_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Re2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Re2_top-A_\(d\).dat`"
echo $STR

STR="Hf2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Re2_top-B_\(d\).dat`"
echo $STR

STR="Hf2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Re2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Hf2Re2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Re2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Hf2Re2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Re2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Hf2Re2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Re2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Hf2Re2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Re2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Hf2Re2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Re2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Hf2Re2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Re2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Ta2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Hf2Ta2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Hf2Ta2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Hf2Ta2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2W2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2W2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2W2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Hf2W2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2W2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2W2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Hf2W2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Hf2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2W2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Hf2W2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Hf2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2W2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Hf2W2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2W2_top-A_\(d\).dat`"
echo $STR

STR="Hf2W2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2W2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2W2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Y2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Y2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Hf2Y2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Y2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Hf2Y2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Y2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Hf2Y2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Y2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Hf2Y2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Y2_top-A_\(d\).dat`"
echo $STR

STR="Hf2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Y2_top-B_\(d\).dat`"
echo $STR

STR="Hf2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Y2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Hf2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mo2Hf2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Hf2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Mo2Hf2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Hf2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Mo2Hf2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mo2Hf2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mo2Hf2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Hf2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Ta2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ta2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mo2Ta2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Mo2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mo2Ta2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ta2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mo2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Mo2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Hf2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Nb2Hf2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Nb2Hf2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Nb2Hf2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Hf2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Nb2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Hf2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Ta2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Nb2Ta2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Nb2Ta2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Nb2Ta2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2Hf2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Pd2Hf2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Hf2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Pd2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Hf2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Pd2Hf2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Hf2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Pd2Hf2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Pd2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Hf2_top-A_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2Ta2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Pd2Ta2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Pd2Ta2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Pd2Ta2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Pd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Pd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Ta2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Hf2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Hf2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Rh2Hf2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Rh2Hf2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Rh2Hf2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Rh2Hf2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Hf2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Rh2Hf2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Hf2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Ta2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Rh2Ta2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Rh2Ta2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Rh2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Rh2Ta2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Rh2Ta2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ta2_top-A_\(d\).dat`"
echo $STR

STR="Rh2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ta2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Hf2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Hf2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ru2Hf2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Hf2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ru2Hf2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ru2Hf2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Hf2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ta2_bridge-B_B-B_\(d\).dat`"
echo $STR

STR="Ru2Ta2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ru2Ta2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Ta2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ru2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ta2_top-B_\(d\).dat`"
echo $STR

STR="Ru2Ta2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Ta2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Hf2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Sc2Hf2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Sc2Hf2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Sc2Hf2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Hf2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Sc2Hf2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Hf2_top-B_\(d\).dat`"
echo $STR

STR="Sc2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Hf2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Sc2Hf2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Hf2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Ta2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Sc2Ta2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Sc2Ta2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Sc2Ta2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2Au2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Au2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ta2Au2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Au2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ta2Au2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Au2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ta2Au2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Au2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ta2Au2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Au2_top-B_\(d\).dat`"
echo $STR

STR="Ta2Au2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Au2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2Hg2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Hg2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Hg2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ta2Hg2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Ta2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Hg2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ta2Hg2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Hg2_top-B_\(d\).dat`"
echo $STR

STR="Ta2Hg2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Hg2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2Ir2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ta2Ir2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ta2Ir2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ta2Ir2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Os2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ta2Os2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Os2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ta2Os2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Os2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ta2Os2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Os2_top-B_\(d\).dat`"
echo $STR

STR="Ta2Os2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Os2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2Pt2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Pt2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ta2Pt2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Pt2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ta2Pt2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Pt2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ta2Pt2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Pt2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ta2Pt2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Pt2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Re2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ta2Re2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Re2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ta2Re2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Re2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ta2Re2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Re2_top-B_\(d\).dat`"
echo $STR

STR="Ta2Re2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Re2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ta2Re2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Re2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2W2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2W2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2W2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ta2W2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2W2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2W2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ta2W2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Ta2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2W2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ta2W2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Ta2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2W2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ta2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Ta2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2W2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Hf2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Hf2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Tc2Hf2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Hf2_top-A_\(d\).dat`"
echo $STR

STR="Tc2Hf2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Hf2_top-B_\(d\).dat`"
echo $STR

STR="Tc2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Hf2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Tc2Hf2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Hf2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Tc2Ta2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Tc2Ta2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ta2_top-A_\(d\).dat`"
echo $STR

STR="Tc2Ta2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ta2_top-B_\(d\).dat`"
echo $STR

STR="Tc2Ta2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Ta2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Ta2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ta2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Hf2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ti2Hf2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ti2Hf2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ti2Hf2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Hf2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ti2Hf2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Hf2_top-B_\(d\).dat`"
echo $STR

STR="Ti2Hf2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Hf2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Ta2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ti2Ta2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ti2Ta2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ti2Ta2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ti2Ta2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="V2Hf2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Hf2.pdos.out.pdos_atm#10\\(V\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Hf2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="V2Hf2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) V2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="V2Hf2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Hf2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) V2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Hf2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="V2Hf2.pdos.out.pdos_atm#10\\(V\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Hf2_top-B_\(d\).dat`"
echo $STR

STR="V2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) V2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Hf2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="V2Hf2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Hf2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="V2Hf2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) V2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="V2Hf2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Hf2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Hf2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="V2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) V2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="V2Ta2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) V2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="V2Ta2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Ta2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) V2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Ta2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="V2Ta2.pdos.out.pdos_atm#10\\(V\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Ta2_top-B_\(d\).dat`"
echo $STR

STR="V2Ta2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Ta2.pdos.out.pdos_atm#10\\(V\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="V2Ta2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Ta2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Y2Ta2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Y2Ta2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Y2Ta2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Y2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Y2Ta2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Y2Ta2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Hf2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Hf2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Zn2Hf2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_top-B_\(d\).dat`"
echo $STR

STR="Zn2Hf2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Hf2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_bridge-A_B-B_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_top-A_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Hf2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zr2Hf2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zr2Hf2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zr2Hf2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Hf2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zr2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Hf2_top-A_\(d\).dat`"
echo $STR

STR="Zr2Hf2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Hf2_top-B_\(d\).dat`"
echo $STR

STR="Zr2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Hf2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zr2Hf2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Hf2_bridge-A_B-B_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Ta2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zr2Ta2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zr2Ta2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zr2Ta2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zr2Ta2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ta2_bridge-A_B-B_\(d\).dat`"
echo $STR

sleep 10

