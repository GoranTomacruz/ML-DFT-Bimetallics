#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-19##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.19.out     ##CHANGE
#SBATCH --error=2022July17files.19.err     ##CHANGE
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
STR="Cr2Zn2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Zn2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Cr2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Cr2Zn2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Zn2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Cr2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Zn2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Zn2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Zn2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Zn2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) V2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) V2Zn2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) V2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Ag2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Zn2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Cd2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Hf2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

sleep 10

STR="Zn2Ir2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#7\\(Ir\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#8\\(Ir\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ir2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2La2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#7\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#8\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2La2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Mo2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#7\\(Mo\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#8\\(Mo\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Mo2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Zn2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Os2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Pd2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Pt2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Re2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Rh2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Ta2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Zn2.pdos.out.pdos_atm#5\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#6\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Tc2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#7\\(Tc\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#8\\(Tc\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Tc2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2W2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Zn2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Zn2W2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Zn2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Y2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Zr2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#7\\(Zr\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#8\\(Zr\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Zr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Ru2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Au2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Nb2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#7\\(Nb\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#8\\(Nb\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Nb2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Zn2.pdos.out.pdos_atm#5\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#6\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

