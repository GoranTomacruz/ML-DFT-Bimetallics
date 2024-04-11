#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-09##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.09.out     ##CHANGE
#SBATCH --error=2022July17files.09.err     ##CHANGE
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

STR="Ni2Ag2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ni2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Au2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Au2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Ni2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Ni2Au2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Au2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ni2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Cd2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Cd2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Ni2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Ni2Cd2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Cd2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Ni2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Cu2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#7\\(Cu\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#8\\(Cu\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Ni2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Cu2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Hf2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ni2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Hg2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Hg2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Ni2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Ni2Hg2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Hg2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Ni2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Ir2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#7\\(Ir\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#8\\(Ir\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ni2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ir2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2La2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2La2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2La2.pdos.out.pdos_atm#7\\(La\\)*\(d\) Ni2La2.pdos.out.pdos_atm#8\\(La\\)*\(d\) Ni2La2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2La2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Ni2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2La2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Mo2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#7\\(Mo\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#8\\(Mo\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Ni2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Mo2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Nb2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#7\\(Nb\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#8\\(Nb\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Ni2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Nb2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Os2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ni2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Pd2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Ni2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Pt2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Ni2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Re2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Ni2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Rh2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Ni2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Ru2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Ni2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Ta2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ni2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2W2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2W2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Ni2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Ni2W2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2W2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Ni2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Y2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ni2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Zn2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Zr2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#7\\(Zr\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#8\\(Zr\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Ni2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

