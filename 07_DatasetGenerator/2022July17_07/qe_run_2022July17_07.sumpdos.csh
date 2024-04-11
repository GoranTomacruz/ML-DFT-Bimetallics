#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-07##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.07.out     ##CHANGE
#SBATCH --error=2022July17files.07.err     ##CHANGE
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
STR="Ag2Hf2.pdos.out.pdos_atm#5\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#6\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ag2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ag2Ta2.pdos.out.pdos_atm#5\\(Ag\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#6\\(Ag\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ag2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cd2Hf2.pdos.out.pdos_atm#5\\(Cd\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#6\\(Cd\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Cd2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cd2Ta2.pdos.out.pdos_atm#5\\(Cd\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#6\\(Cd\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Cd2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Hf2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Cr2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Ta2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Cr2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Hf2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Cu2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Ta2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Cu2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Au2.pdos.out.pdos_atm#5\\(Hf\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#6\\(Hf\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Hf2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Hg2.pdos.out.pdos_atm#5\\(Hf\\)*\(d\) Hf2Hg2.pdos.out.pdos_atm#6\\(Hf\\)*\(d\) Hf2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Hf2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Hf2Hg2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Hg2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hf2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Ir2.pdos.out.pdos_atm#5\\(Hf\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#6\\(Hf\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#7\\(Ir\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#8\\(Ir\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Hf2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Ir2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Os2.pdos.out.pdos_atm#5\\(Hf\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#6\\(Hf\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Hf2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Pt2.pdos.out.pdos_atm#5\\(Hf\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#6\\(Hf\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Hf2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Re2.pdos.out.pdos_atm#5\\(Hf\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#6\\(Hf\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Hf2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Ta2.pdos.out.pdos_atm#5\\(Hf\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#6\\(Hf\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Hf2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2W2.pdos.out.pdos_atm#5\\(Hf\\)*\(d\) Hf2W2.pdos.out.pdos_atm#6\\(Hf\\)*\(d\) Hf2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Hf2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Hf2W2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2W2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Hf2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Hf2Y2.pdos.out.pdos_atm#5\\(Hf\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#6\\(Hf\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Hf2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Hf2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Mo2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Ta2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2Ta2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Mo2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Mo2Ta2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ta2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Mo2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Hf2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Nb2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Ta2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Nb2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2Hf2.pdos.out.pdos_atm#5\\(Pd\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#6\\(Pd\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Pd2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2Ta2.pdos.out.pdos_atm#5\\(Pd\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#6\\(Pd\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Pd2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Hf2.pdos.out.pdos_atm#5\\(Rh\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#6\\(Rh\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Rh2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Ta2.pdos.out.pdos_atm#5\\(Rh\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#6\\(Rh\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Rh2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Hf2.pdos.out.pdos_atm#5\\(Ru\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#6\\(Ru\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ru2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Ta2.pdos.out.pdos_atm#5\\(Ru\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#6\\(Ru\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ru2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Hf2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Sc2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Ta2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Sc2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2Au2.pdos.out.pdos_atm#5\\(Ta\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#6\\(Ta\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ta2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2Hg2.pdos.out.pdos_atm#5\\(Ta\\)*\(d\) Ta2Hg2.pdos.out.pdos_atm#6\\(Ta\\)*\(d\) Ta2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Ta2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Ta2Hg2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Hg2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Ta2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2Ir2.pdos.out.pdos_atm#5\\(Ta\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#6\\(Ta\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#7\\(Ir\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#8\\(Ir\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ta2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Ir2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2Os2.pdos.out.pdos_atm#5\\(Ta\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#6\\(Ta\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ta2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2Pt2.pdos.out.pdos_atm#5\\(Ta\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#6\\(Ta\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Ta2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2Re2.pdos.out.pdos_atm#5\\(Ta\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#6\\(Ta\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Ta2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ta2W2.pdos.out.pdos_atm#5\\(Ta\\)*\(d\) Ta2W2.pdos.out.pdos_atm#6\\(Ta\\)*\(d\) Ta2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Ta2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Ta2W2.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta2W2.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Ta2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Hf2.pdos.out.pdos_atm#5\\(Tc\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#6\\(Tc\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Tc2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Ta2.pdos.out.pdos_atm#5\\(Tc\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#6\\(Tc\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Tc2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Hf2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Ti2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Ta2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ti2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Hf2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Hf2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) V2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) V2Hf2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Hf2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) V2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Ta2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Ta2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) V2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) V2Ta2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Ta2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) V2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Y2Ta2.pdos.out.pdos_atm#5\\(Y\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#6\\(Y\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Y2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Hf2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Ta2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Hf2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zr2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Hf2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Ta2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Zr2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ta2_two-layers_\(d\).dat`"
echo $STR

sleep 10

