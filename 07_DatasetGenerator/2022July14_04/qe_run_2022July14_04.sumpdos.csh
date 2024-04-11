#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-04##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July14files.04.out     ##CHANGE
#SBATCH --error=2022July14files.04.err     ##CHANGE
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
STR="Ag2Au2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Au2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ag2Au2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Au2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ag2Au2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Au2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ag2Au2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Au2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ag2Au2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Au2_top-A_\(d\).dat`"
echo $STR

STR="Ag2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Au2_top-B_\(d\).dat`"
echo $STR

STR="Ag2Au2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Au2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ag2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Au2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Ag2Cd2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Cd2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ag2Cd2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Cd2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ag2Cd2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Cd2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ag2Cd2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Cd2_top-A_\(d\).dat`"
echo $STR

STR="Ag2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Cd2_top-B_\(d\).dat`"
echo $STR

STR="Ag2Cd2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Cd2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Ag2Cd2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Cd2_bridge-A_B-B_\(d\).dat`"
echo $STR

STR="Ag2Cd2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Cd2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ag2Cd2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Cd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ag2Hg2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Ag2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hg2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ag2Hg2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hg2_top-A_\(d\).dat`"
echo $STR

STR="Ag2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hg2_top-B_\(d\).dat`"
echo $STR

STR="Ag2Hg2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Ag2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hg2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Ag2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Os2_top-B_\(d\).dat`"
echo $STR

STR="Ag2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Os2_bridge-B_B-B_\(d\).dat`"
echo $STR

STR="Ag2Os2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Os2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ag2Os2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Os2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="Ag2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Os2_bridge-B_B-B_\(d\).dat`"
echo $STR

STR="Ag2Os2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Os2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ag2Os2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Os2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Ag2Y2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Y2_top-A_\(d\).dat`"
echo $STR

STR="Ag2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Y2_top-B_\(d\).dat`"
echo $STR

STR="Ag2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Y2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ag2Y2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Y2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ag2Y2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Y2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Ag2Y2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Y2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Ag2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ag2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ag2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Cu2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Cu2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Cu2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Cu2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cr2Cu2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Cu2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Cu2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Cu2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cr2Cu2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Cu2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cr2Cu2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Cu2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ru2_top-B_\(d\).dat`"
echo $STR

STR="Cr2Ru2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ru2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Ru2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ru2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cr2Ru2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ru2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Ru2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ru2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cr2Ru2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ru2_top-A_\(d\).dat`"
echo $STR

STR="Cr2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ru2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ag2_top-A_\(d\).dat`"
echo $STR

STR="Cu2Ag2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ag2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cu2Ag2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ag2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Ag2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ag2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ag2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cu2Ag2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ag2_bridge-A_B-B_\(d\).dat`"
echo $STR

STR="Cu2Ag2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ag2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Ag2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ag2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Au2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Au2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cu2Au2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Au2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Au2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Au2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Au2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Au2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Au2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cu2Au2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Au2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Cd2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Cd2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Cd2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cu2Cd2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Cu2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Cd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Cd2_top-A_\(d\).dat`"
echo $STR

STR="Cu2Cd2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Cd2_top-B_\(d\).dat`"
echo $STR

STR="Cu2Cd2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Cu2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Cd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Hg2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hg2_top-A_\(d\).dat`"
echo $STR

STR="Cu2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hg2_top-B_\(d\).dat`"
echo $STR

STR="Cu2Hg2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Hg2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hg2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cu2Hg2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hg2_top-A_\(d\).dat`"
echo $STR

STR="Cu2Hg2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Cu2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hg2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Hg2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Cu2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hg2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Mo2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Mo2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Mo2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Mo2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Mo2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Mo2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Mo2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Mo2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Mo2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cu2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Mo2_top-B_\(d\).dat`"
echo $STR

STR="Cu2Mo2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Mo2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Nb2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Nb2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cu2Nb2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Nb2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Nb2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Nb2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Nb2_top-B_\(d\).dat`"
echo $STR

STR="Cu2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Nb2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cu2Nb2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Nb2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Nb2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Nb2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Os2_top-B_\(d\).dat`"
echo $STR

STR="Cu2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Os2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cu2Os2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Os2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Os2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Os2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Os2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Os2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Os2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Os2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Os2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Os2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Os2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Rh2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Rh2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Rh2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Rh2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Rh2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Rh2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Rh2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Rh2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Rh2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ru2_top-B_\(d\).dat`"
echo $STR

STR="Cu2Ru2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ru2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Ru2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ru2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Ru2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ru2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Ru2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ru2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ru2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cu2Ru2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ru2_bridge-A_B-B_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Y2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Y2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Y2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cu2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Cu2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Y2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cu2Y2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Cu2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Y2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Y2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Y2_top-A_\(d\).dat`"
echo $STR

STR="Cu2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Y2_top-B_\(d\).dat`"
echo $STR

STR="Cu2Y2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Cu2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Y2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Zr2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zr2_top-A_\(d\).dat`"
echo $STR

STR="Cu2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zr2_top-B_\(d\).dat`"
echo $STR

STR="Cu2Zr2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zr2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Zr2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zr2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Cu2Zr2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zr2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cu2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zr2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Ag2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ag2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mo2Ag2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ag2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mo2Ag2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ag2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mo2Ag2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ag2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mo2Ag2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ag2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mo2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ag2_top-A_\(d\).dat`"
echo $STR

STR="Mo2Ag2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ag2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Mo2Ag2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ag2_top-B_\(d\).dat`"
echo $STR

STR="Mo2Ag2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ag2_bridge-B_B-B_\(d\).dat`"
echo $STR

STR="Mo2Ag2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ag2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Ru2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ru2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mo2Ru2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ru2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mo2Ru2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ru2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mo2Ru2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ru2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mo2Ru2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ru2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Ag2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ag2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Nb2Ag2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ag2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Nb2Ag2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ag2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Nb2Ag2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ag2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Nb2Ag2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ag2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Nb2Ag2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ag2_top-B_\(d\).dat`"
echo $STR

STR="Nb2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ag2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Nb2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ag2_top-A_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Ru2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ru2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="Nb2Ru2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ru2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Nb2Ru2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ru2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Nb2Ru2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ru2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Ag2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ag2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Rh2Ag2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ag2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Rh2Ag2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ag2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Rh2Ag2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ag2_bridge-B_B-B_\(d\).dat`"
echo $STR

STR="Rh2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ag2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Rh2Ag2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ag2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Rh2Ag2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ag2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Ag2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ag2_top-B_\(d\).dat`"
echo $STR

STR="Ru2Ag2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ag2_bridge-B_B-B_\(d\).dat`"
echo $STR

STR="Ru2Ag2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ag2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Ag2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ag2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ag2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="Ru2Ag2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ag2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ru2Ag2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ag2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Au2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Au2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Au2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ru2Au2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Au2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Au2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Au2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Au2_top-B_\(d\).dat`"
echo $STR

STR="Ru2Au2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Au2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Cd2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Cd2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Cd2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ru2Cd2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Cd2_top-B_\(d\).dat`"
echo $STR

STR="Ru2Cd2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Ru2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Cd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

sleep 10

STR="Ru2Os2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Os2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ru2Os2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Os2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Os2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Os2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ru2Os2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Os2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Os2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ru2Os2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Os2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ru2Os2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Os2_bridge-A_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Rh2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Rh2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ru2Rh2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Rh2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Rh2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Rh2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ru2Rh2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Rh2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Rh2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Y2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Y2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ru2Y2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Y2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Y2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ru2Y2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Y2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Y2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Y2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Ag2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ag2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Sc2Ag2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ag2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Sc2Ag2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ag2_top-B_\(d\).dat`"
echo $STR

STR="Sc2Ag2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ag2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Sc2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ag2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Cu2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Cu2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Sc2Cu2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Cu2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Sc2Cu2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Cu2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Sc2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Cu2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Sc2Cu2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Cu2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Sc2Cu2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Cu2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ru2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Sc2Ru2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ru2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Sc2Ru2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ru2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Sc2Ru2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ru2_top-B_\(d\).dat`"
echo $STR

STR="Sc2Ru2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ru2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Sc2Ru2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ru2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Sc2Ru2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ru2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Sc2Ru2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ru2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Ag2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ag2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zr2Ag2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ag2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zr2Ag2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ag2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zr2Ag2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ag2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zr2Ag2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ag2_top-B_\(d\).dat`"
echo $STR

STR="Zr2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ag2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zr2Ag2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ag2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zr2Ag2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ag2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Zr2Ag2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ag2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ru2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zr2Ru2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ru2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zr2Ru2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ru2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Zr2Ru2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ru2_top-B_\(d\).dat`"
echo $STR

STR="Zr2Ru2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ru2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zr2Ru2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ru2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zr2Ru2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ru2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

