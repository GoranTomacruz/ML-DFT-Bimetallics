#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-10##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.10.out     ##CHANGE
#SBATCH --error=2022July17files.10.err     ##CHANGE
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
STR="Co2Ag2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Ag2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Co2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Co2Ag2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Ag2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Co2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Au2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Au2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Co2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Co2Au2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Au2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Co2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Cd2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Cd2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Co2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Co2Cd2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Cd2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Co2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Cu2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Cu2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Cu2.pdos.out.pdos_atm#7\\(Cu\\)*\(d\) Co2Cu2.pdos.out.pdos_atm#8\\(Cu\\)*\(d\) Co2Cu2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Cu2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Co2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Cu2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Hf2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Hf2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Co2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Co2Hf2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Hf2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Co2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Hg2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Hg2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Co2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Co2Hg2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Hg2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Co2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Ir2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Ir2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Ir2.pdos.out.pdos_atm#7\\(Ir\\)*\(d\) Co2Ir2.pdos.out.pdos_atm#8\\(Ir\\)*\(d\) Co2Ir2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Ir2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Co2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Ir2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2La2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2La2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2La2.pdos.out.pdos_atm#7\\(La\\)*\(d\) Co2La2.pdos.out.pdos_atm#8\\(La\\)*\(d\) Co2La2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2La2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Co2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2La2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Ni2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Ni2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Ni2.pdos.out.pdos_atm#7\\(Ni\\)*\(d\) Co2Ni2.pdos.out.pdos_atm#8\\(Ni\\)*\(d\) Co2Ni2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Ni2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Ni2.pdos.out.pdos_atm#11\\(Ni\\)*\(d\) Co2Ni2.pdos.out.pdos_atm#12\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Ni2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Os2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Os2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Co2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Co2Os2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Os2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Co2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Pd2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Pd2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Co2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Co2Pd2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Pd2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Co2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Pt2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Pt2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Co2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Co2Pt2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Pt2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Co2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Re2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Re2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Co2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Co2Re2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Re2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Co2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Rh2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Rh2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Co2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Co2Rh2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Rh2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Co2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Ru2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Ru2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) Co2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) Co2Ru2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Ru2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Co2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Sc2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Sc2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Sc2.pdos.out.pdos_atm#7\\(Sc\\)*\(d\) Co2Sc2.pdos.out.pdos_atm#8\\(Sc\\)*\(d\) Co2Sc2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Sc2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Sc2.pdos.out.pdos_atm#11\\(Sc\\)*\(d\) Co2Sc2.pdos.out.pdos_atm#12\\(Sc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Sc2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Ti2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Ti2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Ti2.pdos.out.pdos_atm#7\\(Ti\\)*\(d\) Co2Ti2.pdos.out.pdos_atm#8\\(Ti\\)*\(d\) Co2Ti2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Ti2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Ti2.pdos.out.pdos_atm#11\\(Ti\\)*\(d\) Co2Ti2.pdos.out.pdos_atm#12\\(Ti\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Ti2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2V2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2V2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2V2.pdos.out.pdos_atm#7\\(V\\)*\(d\) Co2V2.pdos.out.pdos_atm#8\\(V\\)*\(d\) Co2V2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2V2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2V2.pdos.out.pdos_atm#11\\(V\\)*\(d\) Co2V2.pdos.out.pdos_atm#12\\(V\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2V2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2W2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2W2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Co2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Co2W2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2W2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Co2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Y2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Y2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Co2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Co2Y2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Y2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Co2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Zn2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Zr2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Zr2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Zr2.pdos.out.pdos_atm#7\\(Zr\\)*\(d\) Co2Zr2.pdos.out.pdos_atm#8\\(Zr\\)*\(d\) Co2Zr2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Zr2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Co2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Zr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

