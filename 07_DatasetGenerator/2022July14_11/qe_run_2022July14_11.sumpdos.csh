#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-11##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July14files.11.out     ##CHANGE
#SBATCH --error=2022July14files.11.err     ##CHANGE
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
sleep 10

STR="Cr2Mn2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Mn2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cr2Mn2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#11\\(Mn\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#12\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Mn2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Cr2Mn2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Mn2_top-A_\(d\).dat`"
echo $STR

STR="Cr2Mn2.pdos.out.pdos_atm#11\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Mn2_top-B_\(d\).dat`"
echo $STR

STR="Cr2Mn2.pdos.out.pdos_atm#11\\(Mn\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#12\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Mn2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cr2Mn2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#11\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Mn2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Cr2Mn2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#12\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Mn2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Mn2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#11\\(Mn\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#12\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Mn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Mn2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#11\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Mn2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Ag2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ag2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ag2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Mn2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ag2_top-A_\(d\).dat`"
echo $STR

STR="Mn2Ag2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ag2_top-B_\(d\).dat`"
echo $STR

STR="Mn2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Mn2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ag2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Au2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Au2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Au2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Cd2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cd2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Mn2Cd2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cd2_top-B_\(d\).dat`"
echo $STR

STR="Mn2Cd2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Cd2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Cd2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cd2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Cu2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cu2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Mn2Cu2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cu2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Mn2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cu2_top-A_\(d\).dat`"
echo $STR

STR="Mn2Cu2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cu2_top-B_\(d\).dat`"
echo $STR

STR="Mn2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cu2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mn2Cu2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cu2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Cu2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cu2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Cu2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cu2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Hg2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Hg2_top-B_\(d\).dat`"
echo $STR

STR="Mn2Hg2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Hg2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Hg2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Ir2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Ir2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Ir2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Ir2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ir2_top-B_\(d\).dat`"
echo $STR

STR="Mn2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2La2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2La2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2La2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Mn2La2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Mn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2La2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Mn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2La2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mn2La2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2La2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2La2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Mn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2La2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="Mn2La2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Mn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2La2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2La2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2La2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2La2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2La2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2La2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Mn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2La2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Mo2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Mo2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Mo2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Mo2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Mo2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Mo2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Mo2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Mo2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Nb2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Nb2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Nb2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mn2Nb2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Mn2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Nb2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Mn2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Nb2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Ni2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#11\\(Ni\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#12\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ni2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Mn2Ni2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#12\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ni2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Ni2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#11\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ni2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Pd2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Pd2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Pd2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mn2Pd2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Pd2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Pd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Pd2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Pd2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Pd2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Pt2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Pt2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Pt2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mn2Pt2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Pt2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Pt2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Re2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Re2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mn2Re2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Re2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Re2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Re2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Re2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Re2_top-A_\(d\).dat`"
echo $STR

STR="Mn2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Re2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Mn2Re2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Re2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Re2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Re2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Rh2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Rh2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Mn2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Rh2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Mn2Rh2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Rh2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Rh2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Rh2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Rh2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Rh2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Rh2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Rh2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mn2Rh2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Rh2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ru2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Mn2Ru2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ru2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Mn2Ru2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ru2_top-A_\(d\).dat`"
echo $STR

STR="Mn2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ru2_top-B_\(d\).dat`"
echo $STR

STR="Mn2Ru2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ru2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mn2Ru2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ru2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Ru2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ru2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Ru2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ru2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Ru2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ru2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Ta2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ta2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Mn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ta2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Mn2Ta2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Mn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Ta2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Mn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2W2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Mn2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2W2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2W2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2W2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Mn2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2W2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Mn2W2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2W2_top-A_\(d\).dat`"
echo $STR

STR="Mn2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2W2_top-B_\(d\).dat`"
echo $STR

STR="Mn2W2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2W2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2W2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Y2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Y2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mn2Y2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Y2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Mn2Y2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Y2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Y2_top-B_\(d\).dat`"
echo $STR

STR="Mn2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Y2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Mn2Y2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Y2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Y2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Y2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Zn2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mn2Zn2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Zn2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Zn2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_top-A_\(d\).dat`"
echo $STR

STR="Mn2Zn2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Zn2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Zn2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Zr2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zr2_top-A_\(d\).dat`"
echo $STR

STR="Mn2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zr2_top-B_\(d\).dat`"
echo $STR

STR="Mn2Zr2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zr2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mn2Zr2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zr2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Mn2Zr2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zr2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zr2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Mn2Zr2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zr2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

