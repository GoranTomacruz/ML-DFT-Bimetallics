#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-11##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.11.out     ##CHANGE
#SBATCH --error=2022July17files.11.err     ##CHANGE
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

STR="Cr2Mn2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#7\\(Mn\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#8\\(Mn\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#11\\(Mn\\)*\(d\) Cr2Mn2.pdos.out.pdos_atm#12\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Mn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Ag2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Ag2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Mn2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Mn2Ag2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ag2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Mn2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Au2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Au2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Mn2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Mn2Au2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Au2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Mn2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Cd2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Mn2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Cu2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#7\\(Cu\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#8\\(Cu\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Mn2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Cu2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Hg2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Hg2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Mn2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Mn2Hg2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Hg2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Mn2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Ir2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#7\\(Ir\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#8\\(Ir\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Mn2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ir2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2La2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2La2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2La2.pdos.out.pdos_atm#7\\(La\\)*\(d\) Mn2La2.pdos.out.pdos_atm#8\\(La\\)*\(d\) Mn2La2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2La2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Mn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2La2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Mo2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#7\\(Mo\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#8\\(Mo\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Mn2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Mo2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Nb2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Nb2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Nb2.pdos.out.pdos_atm#7\\(Nb\\)*\(d\) Mn2Nb2.pdos.out.pdos_atm#8\\(Nb\\)*\(d\) Mn2Nb2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Nb2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Mn2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Nb2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Ni2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#7\\(Ni\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#8\\(Ni\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#11\\(Ni\\)*\(d\) Mn2Ni2.pdos.out.pdos_atm#12\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ni2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Pd2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Pd2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Mn2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Mn2Pd2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Pd2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Mn2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Pt2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Pt2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Mn2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Mn2Pt2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Pt2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Mn2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Re2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Mn2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Rh2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Mn2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Ru2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Mn2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Ta2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Ta2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Mn2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Mn2Ta2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Ta2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Mn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2W2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2W2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Mn2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Mn2W2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2W2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Mn2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Y2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Mn2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Zn2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Zr2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#7\\(Zr\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#8\\(Zr\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Mn2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

