#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-01##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.01.out     ##CHANGE
#SBATCH --error=2022July17files.01.err     ##CHANGE
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
STR="Ag2W2.pdos.out.pdos_atm#5\\(Ag\\)*\(d\) Ag2W2.pdos.out.pdos_atm#6\\(Ag\\)*\(d\) Ag2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Ag2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Ag2W2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2W2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Ag2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cd2W2.pdos.out.pdos_atm#5\\(Cd\\)*\(d\) Cd2W2.pdos.out.pdos_atm#6\\(Cd\\)*\(d\) Cd2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Cd2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Cd2W2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2W2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Cd2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Pd2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Pd2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Cr2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Cr2Pd2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Pd2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Cr2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2W2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2W2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Cr2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Cr2W2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2W2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Cr2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Pd2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Pd2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Cu2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Cu2Pd2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Pd2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Cu2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2W2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2W2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Cu2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Cu2W2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2W2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Cu2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Pd2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2Pd2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Mo2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Mo2Pd2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Pd2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Mo2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2W2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2W2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Mo2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Mo2W2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2W2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Mo2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Pd2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Pd2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Nb2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Nb2Pd2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Pd2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Nb2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2W2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2W2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Nb2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Nb2W2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2W2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Nb2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2Ag2.pdos.out.pdos_atm#5\\(Pd\\)*\(d\) Pd2Ag2.pdos.out.pdos_atm#6\\(Pd\\)*\(d\) Pd2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Pd2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Pd2Ag2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Ag2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Pd2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2Au2.pdos.out.pdos_atm#5\\(Pd\\)*\(d\) Pd2Au2.pdos.out.pdos_atm#6\\(Pd\\)*\(d\) Pd2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Pd2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Pd2Au2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Au2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Pd2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2Cd2.pdos.out.pdos_atm#5\\(Pd\\)*\(d\) Pd2Cd2.pdos.out.pdos_atm#6\\(Pd\\)*\(d\) Pd2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Pd2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Pd2Cd2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Cd2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Pd2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2Hg2.pdos.out.pdos_atm#5\\(Pd\\)*\(d\) Pd2Hg2.pdos.out.pdos_atm#6\\(Pd\\)*\(d\) Pd2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Pd2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Pd2Hg2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Hg2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Pd2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2Ir2.pdos.out.pdos_atm#5\\(Pd\\)*\(d\) Pd2Ir2.pdos.out.pdos_atm#6\\(Pd\\)*\(d\) Pd2Ir2.pdos.out.pdos_atm#7\\(Ir\\)*\(d\) Pd2Ir2.pdos.out.pdos_atm#8\\(Ir\\)*\(d\) Pd2Ir2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Ir2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Pd2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Ir2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2Os2.pdos.out.pdos_atm#5\\(Pd\\)*\(d\) Pd2Os2.pdos.out.pdos_atm#6\\(Pd\\)*\(d\) Pd2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Pd2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Pd2Os2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Os2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Pd2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2Pt2.pdos.out.pdos_atm#5\\(Pd\\)*\(d\) Pd2Pt2.pdos.out.pdos_atm#6\\(Pd\\)*\(d\) Pd2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Pd2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Pd2Pt2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Pt2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pd2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2Re2.pdos.out.pdos_atm#5\\(Pd\\)*\(d\) Pd2Re2.pdos.out.pdos_atm#6\\(Pd\\)*\(d\) Pd2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Pd2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Pd2Re2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Re2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Pd2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2W2.pdos.out.pdos_atm#5\\(Pd\\)*\(d\) Pd2W2.pdos.out.pdos_atm#6\\(Pd\\)*\(d\) Pd2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Pd2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Pd2W2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2W2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Pd2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pd2Y2.pdos.out.pdos_atm#5\\(Pd\\)*\(d\) Pd2Y2.pdos.out.pdos_atm#6\\(Pd\\)*\(d\) Pd2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Pd2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Pd2Y2.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd2Y2.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Pd2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Pd2.pdos.out.pdos_atm#5\\(Rh\\)*\(d\) Rh2Pd2.pdos.out.pdos_atm#6\\(Rh\\)*\(d\) Rh2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Rh2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Rh2Pd2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Pd2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Rh2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2W2.pdos.out.pdos_atm#5\\(Rh\\)*\(d\) Rh2W2.pdos.out.pdos_atm#6\\(Rh\\)*\(d\) Rh2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Rh2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Rh2W2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2W2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Rh2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Pd2.pdos.out.pdos_atm#5\\(Ru\\)*\(d\) Ru2Pd2.pdos.out.pdos_atm#6\\(Ru\\)*\(d\) Ru2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Ru2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Ru2Pd2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Pd2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Ru2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2W2.pdos.out.pdos_atm#5\\(Ru\\)*\(d\) Ru2W2.pdos.out.pdos_atm#6\\(Ru\\)*\(d\) Ru2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Ru2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Ru2W2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2W2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Ru2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Pd2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Pd2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Sc2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Sc2Pd2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Pd2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Sc2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2V2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2V2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2V2.pdos.out.pdos_atm#7\\(V\\)*\(d\) Sc2V2.pdos.out.pdos_atm#8\\(V\\)*\(d\) Sc2V2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2V2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2V2.pdos.out.pdos_atm#11\\(V\\)*\(d\) Sc2V2.pdos.out.pdos_atm#12\\(V\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2V2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2W2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2W2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Sc2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Sc2W2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2W2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Sc2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Pd2.pdos.out.pdos_atm#5\\(Tc\\)*\(d\) Tc2Pd2.pdos.out.pdos_atm#6\\(Tc\\)*\(d\) Tc2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Tc2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Tc2Pd2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Pd2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Tc2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2W2.pdos.out.pdos_atm#5\\(Tc\\)*\(d\) Tc2W2.pdos.out.pdos_atm#6\\(Tc\\)*\(d\) Tc2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Tc2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Tc2W2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2W2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Tc2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Pd2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Pd2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Ti2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Ti2Pd2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Pd2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Ti2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2V2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2V2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2V2.pdos.out.pdos_atm#7\\(V\\)*\(d\) Ti2V2.pdos.out.pdos_atm#8\\(V\\)*\(d\) Ti2V2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2V2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2V2.pdos.out.pdos_atm#11\\(V\\)*\(d\) Ti2V2.pdos.out.pdos_atm#12\\(V\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2V2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2W2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2W2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Ti2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Ti2W2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2W2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Ti2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Ag2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Ag2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) V2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) V2Ag2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Ag2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) V2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Au2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Au2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) V2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) V2Au2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Au2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) V2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Cd2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Cd2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) V2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) V2Cd2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Cd2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) V2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Cr2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Cr2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Cr2.pdos.out.pdos_atm#7\\(Cr\\)*\(d\) V2Cr2.pdos.out.pdos_atm#8\\(Cr\\)*\(d\) V2Cr2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Cr2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Cr2.pdos.out.pdos_atm#11\\(Cr\\)*\(d\) V2Cr2.pdos.out.pdos_atm#12\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Cr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Cu2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Cu2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Cu2.pdos.out.pdos_atm#7\\(Cu\\)*\(d\) V2Cu2.pdos.out.pdos_atm#8\\(Cu\\)*\(d\) V2Cu2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Cu2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) V2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Cu2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Hg2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Hg2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) V2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) V2Hg2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Hg2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) V2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Ir2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Ir2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Ir2.pdos.out.pdos_atm#7\\(Ir\\)*\(d\) V2Ir2.pdos.out.pdos_atm#8\\(Ir\\)*\(d\) V2Ir2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Ir2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) V2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Ir2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Mo2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Mo2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Mo2.pdos.out.pdos_atm#7\\(Mo\\)*\(d\) V2Mo2.pdos.out.pdos_atm#8\\(Mo\\)*\(d\) V2Mo2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Mo2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) V2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Mo2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Nb2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Nb2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Nb2.pdos.out.pdos_atm#7\\(Nb\\)*\(d\) V2Nb2.pdos.out.pdos_atm#8\\(Nb\\)*\(d\) V2Nb2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Nb2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) V2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Nb2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Os2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Os2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) V2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) V2Os2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Os2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) V2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Pd2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Pd2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) V2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) V2Pd2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Pd2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) V2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Pt2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Pt2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) V2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) V2Pt2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Pt2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) V2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Re2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Re2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) V2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) V2Re2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Re2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) V2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Rh2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Rh2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) V2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) V2Rh2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Rh2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) V2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Ru2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Ru2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) V2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) V2Ru2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Ru2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) V2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Tc2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Tc2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Tc2.pdos.out.pdos_atm#7\\(Tc\\)*\(d\) V2Tc2.pdos.out.pdos_atm#8\\(Tc\\)*\(d\) V2Tc2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Tc2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) V2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Tc2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2W2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2W2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) V2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) V2W2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2W2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) V2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

sleep 10

STR="V2Zn2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) V2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) V2Zn2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) V2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V2Zr2.pdos.out.pdos_atm#5\\(V\\)*\(d\) V2Zr2.pdos.out.pdos_atm#6\\(V\\)*\(d\) V2Zr2.pdos.out.pdos_atm#7\\(Zr\\)*\(d\) V2Zr2.pdos.out.pdos_atm#8\\(Zr\\)*\(d\) V2Zr2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Zr2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) V2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Zr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="W2Au2.pdos.out.pdos_atm#5\\(W\\)*\(d\) W2Au2.pdos.out.pdos_atm#6\\(W\\)*\(d\) W2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) W2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) W2Au2.pdos.out.pdos_atm#9\\(W\\)*\(d\) W2Au2.pdos.out.pdos_atm#10\\(W\\)*\(d\) W2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) W2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > W2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="W2Hg2.pdos.out.pdos_atm#5\\(W\\)*\(d\) W2Hg2.pdos.out.pdos_atm#6\\(W\\)*\(d\) W2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) W2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) W2Hg2.pdos.out.pdos_atm#9\\(W\\)*\(d\) W2Hg2.pdos.out.pdos_atm#10\\(W\\)*\(d\) W2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) W2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > W2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="W2Ir2.pdos.out.pdos_atm#5\\(W\\)*\(d\) W2Ir2.pdos.out.pdos_atm#6\\(W\\)*\(d\) W2Ir2.pdos.out.pdos_atm#7\\(Ir\\)*\(d\) W2Ir2.pdos.out.pdos_atm#8\\(Ir\\)*\(d\) W2Ir2.pdos.out.pdos_atm#9\\(W\\)*\(d\) W2Ir2.pdos.out.pdos_atm#10\\(W\\)*\(d\) W2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) W2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > W2Ir2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="W2Os2.pdos.out.pdos_atm#5\\(W\\)*\(d\) W2Os2.pdos.out.pdos_atm#6\\(W\\)*\(d\) W2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) W2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) W2Os2.pdos.out.pdos_atm#9\\(W\\)*\(d\) W2Os2.pdos.out.pdos_atm#10\\(W\\)*\(d\) W2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) W2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > W2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="W2Pt2.pdos.out.pdos_atm#5\\(W\\)*\(d\) W2Pt2.pdos.out.pdos_atm#6\\(W\\)*\(d\) W2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) W2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) W2Pt2.pdos.out.pdos_atm#9\\(W\\)*\(d\) W2Pt2.pdos.out.pdos_atm#10\\(W\\)*\(d\) W2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) W2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > W2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="W2Re2.pdos.out.pdos_atm#5\\(W\\)*\(d\) W2Re2.pdos.out.pdos_atm#6\\(W\\)*\(d\) W2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) W2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) W2Re2.pdos.out.pdos_atm#9\\(W\\)*\(d\) W2Re2.pdos.out.pdos_atm#10\\(W\\)*\(d\) W2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) W2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > W2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Y2W2.pdos.out.pdos_atm#5\\(Y\\)*\(d\) Y2W2.pdos.out.pdos_atm#6\\(Y\\)*\(d\) Y2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Y2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Y2W2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2W2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Y2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Pd2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Zr2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#7\\(Zr\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#8\\(Zr\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Zr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2W2.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Zn2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Zn2W2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Zn2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Pd2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Pd2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Zr2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Zr2Pd2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Pd2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Zr2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2W2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2W2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2W2.pdos.out.pdos_atm#7\\(W\\)*\(d\) Zr2W2.pdos.out.pdos_atm#8\\(W\\)*\(d\) Zr2W2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2W2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Zr2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2W2_two-layers_\(d\).dat`"
echo $STR

sleep 10

