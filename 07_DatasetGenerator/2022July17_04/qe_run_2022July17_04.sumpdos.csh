#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-04##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.04.out     ##CHANGE
#SBATCH --error=2022July17files.04.err     ##CHANGE
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
STR="Ag2Au2.pdos.out.pdos_atm#5\\(Ag\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#6\\(Ag\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ag2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ag2Cd2.pdos.out.pdos_atm#5\\(Ag\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#6\\(Ag\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Ag2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ag2Hg2.pdos.out.pdos_atm#5\\(Ag\\)*\(d\) Ag2Hg2.pdos.out.pdos_atm#6\\(Ag\\)*\(d\) Ag2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Ag2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Ag2Hg2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Hg2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Ag2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ag2Os2.pdos.out.pdos_atm#5\\(Ag\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#6\\(Ag\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ag2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ag2Y2.pdos.out.pdos_atm#5\\(Ag\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#6\\(Ag\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ag2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Ag2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Ag2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Cr2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Cr2Ag2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ag2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Cr2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Cu2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#7\\(Cu\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#8\\(Cu\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Cr2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Cu2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Ru2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Cr2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Ag2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Cu2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Au2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Cu2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Cd2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Cd2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Cu2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Cu2Cd2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Cd2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Cu2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Hg2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Hg2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Cu2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Cu2Hg2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Hg2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Cu2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Mo2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#7\\(Mo\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#8\\(Mo\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Cu2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Mo2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Nb2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#7\\(Nb\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#8\\(Nb\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Cu2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Nb2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Os2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Cu2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Rh2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Cu2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Ru2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Cu2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Y2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Y2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Cu2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Cu2Y2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Y2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Cu2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Zr2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#7\\(Zr\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#8\\(Zr\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Cu2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Ag2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Mo2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Ru2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Mo2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Ag2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Nb2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Ru2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Nb2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Ag2.pdos.out.pdos_atm#5\\(Rh\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#6\\(Rh\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Rh2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Ag2.pdos.out.pdos_atm#5\\(Ru\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#6\\(Ru\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ru2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Au2.pdos.out.pdos_atm#5\\(Ru\\)*\(d\) Ru2Au2.pdos.out.pdos_atm#6\\(Ru\\)*\(d\) Ru2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Ru2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Ru2Au2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Au2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ru2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Cd2.pdos.out.pdos_atm#5\\(Ru\\)*\(d\) Ru2Cd2.pdos.out.pdos_atm#6\\(Ru\\)*\(d\) Ru2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Ru2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Ru2Cd2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Cd2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Ru2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

sleep 10

STR="Ru2Os2.pdos.out.pdos_atm#5\\(Ru\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#6\\(Ru\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ru2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Rh2.pdos.out.pdos_atm#5\\(Ru\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#6\\(Ru\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Ru2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Y2.pdos.out.pdos_atm#5\\(Ru\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#6\\(Ru\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ru2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Ag2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Sc2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Cu2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#7\\(Cu\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#8\\(Cu\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Sc2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Cu2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Ru2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Sc2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Ag2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Zr2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Ru2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Zr2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

