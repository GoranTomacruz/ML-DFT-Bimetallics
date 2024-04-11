#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-08##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.08.out     ##CHANGE
#SBATCH --error=2022July17files.08.err     ##CHANGE
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
STR="Cr2La2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2La2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2La2.pdos.out.pdos_atm#7\\(La\\)*\(d\) Cr2La2.pdos.out.pdos_atm#8\\(La\\)*\(d\) Cr2La2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2La2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Cr2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2La2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2La2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2La2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2La2.pdos.out.pdos_atm#7\\(La\\)*\(d\) Cu2La2.pdos.out.pdos_atm#8\\(La\\)*\(d\) Cu2La2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2La2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Cu2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2La2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Ag2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Ag2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) La2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) La2Ag2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ag2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) La2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Au2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Au2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) La2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) La2Au2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Au2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) La2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Cd2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Cd2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) La2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) La2Cd2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Cd2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) La2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Hf2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) La2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) La2Hf2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) La2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Hg2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Hg2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) La2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) La2Hg2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Hg2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) La2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Ir2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Ir2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Ir2.pdos.out.pdos_atm#7\\(Ir\\)*\(d\) La2Ir2.pdos.out.pdos_atm#8\\(Ir\\)*\(d\) La2Ir2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ir2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) La2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ir2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Mo2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Mo2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Mo2.pdos.out.pdos_atm#7\\(Mo\\)*\(d\) La2Mo2.pdos.out.pdos_atm#8\\(Mo\\)*\(d\) La2Mo2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Mo2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) La2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Mo2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Nb2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#7\\(Nb\\)*\(d\) La2Nb2.pdos.out.pdos_atm#8\\(Nb\\)*\(d\) La2Nb2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) La2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Nb2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Os2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Os2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) La2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) La2Os2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Os2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) La2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Pd2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Pd2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) La2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) La2Pd2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Pd2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) La2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Pt2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Pt2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) La2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) La2Pt2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Pt2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) La2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Re2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Re2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) La2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) La2Re2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Re2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) La2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Rh2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Rh2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) La2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) La2Rh2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Rh2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) La2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Ru2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Ru2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) La2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) La2Ru2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ru2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) La2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Ta2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Ta2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) La2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) La2Ta2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Ta2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) La2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Tc2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Tc2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Tc2.pdos.out.pdos_atm#7\\(Tc\\)*\(d\) La2Tc2.pdos.out.pdos_atm#8\\(Tc\\)*\(d\) La2Tc2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Tc2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) La2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Tc2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2W2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2W2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) La2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) La2W2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2W2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) La2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Y2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Y2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) La2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) La2Y2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Y2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) La2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La2Zr2.pdos.out.pdos_atm#5\\(La\\)*\(d\) La2Zr2.pdos.out.pdos_atm#6\\(La\\)*\(d\) La2Zr2.pdos.out.pdos_atm#7\\(Zr\\)*\(d\) La2Zr2.pdos.out.pdos_atm#8\\(Zr\\)*\(d\) La2Zr2.pdos.out.pdos_atm#9\\(La\\)*\(d\) La2Zr2.pdos.out.pdos_atm#10\\(La\\)*\(d\) La2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) La2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > La2Zr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2La2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2La2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2La2.pdos.out.pdos_atm#7\\(La\\)*\(d\) Sc2La2.pdos.out.pdos_atm#8\\(La\\)*\(d\) Sc2La2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2La2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Sc2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2La2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2La2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2La2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2La2.pdos.out.pdos_atm#7\\(La\\)*\(d\) Ti2La2.pdos.out.pdos_atm#8\\(La\\)*\(d\) Ti2La2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2La2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Ti2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2La2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2La2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2La2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2La2.pdos.out.pdos_atm#7\\(La\\)*\(d\) V2La2.pdos.out.pdos_atm#8\\(La\\)*\(d\) V2La2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2La2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) V2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2La2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2La2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#7\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#8\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2La2_two-layers_\(d\).dat`"
echo $STR

sleep 10

