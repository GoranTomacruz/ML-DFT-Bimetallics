#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-03##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.03.out     ##CHANGE
#SBATCH --error=2022July17files.03.err     ##CHANGE
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
STR="Ag2Pt2.pdos.out.pdos_atm#5\\(Ag\\)*\(d\) Ag2Pt2.pdos.out.pdos_atm#6\\(Ag\\)*\(d\) Ag2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Ag2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Ag2Pt2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Pt2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Ag2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ag2Re2.pdos.out.pdos_atm#5\\(Ag\\)*\(d\) Ag2Re2.pdos.out.pdos_atm#6\\(Ag\\)*\(d\) Ag2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Ag2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Ag2Re2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Re2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Ag2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cd2Pt2.pdos.out.pdos_atm#5\\(Cd\\)*\(d\) Cd2Pt2.pdos.out.pdos_atm#6\\(Cd\\)*\(d\) Cd2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Cd2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Cd2Pt2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Pt2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Cd2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cd2Re2.pdos.out.pdos_atm#5\\(Cd\\)*\(d\) Cd2Re2.pdos.out.pdos_atm#6\\(Cd\\)*\(d\) Cd2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Cd2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Cd2Re2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Re2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Cd2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Pt2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Pt2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Cr2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Cr2Pt2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Pt2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Cr2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Re2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Re2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Cr2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Cr2Re2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Re2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Cr2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Pt2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Pt2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Cu2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Cu2Pt2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Pt2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Cu2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Re2.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu2Re2.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Cu2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Cu2Re2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Re2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Cu2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Pt2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2Pt2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Mo2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Mo2Pt2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Pt2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Mo2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Re2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2Re2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Mo2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Mo2Re2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Re2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Mo2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Pt2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Pt2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Nb2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Nb2Pt2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Pt2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Nb2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Re2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Re2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Nb2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Nb2Re2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Re2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Nb2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Os2Pt2.pdos.out.pdos_atm#5\\(Os\\)*\(d\) Os2Pt2.pdos.out.pdos_atm#6\\(Os\\)*\(d\) Os2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Os2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Os2Pt2.pdos.out.pdos_atm#9\\(Os\\)*\(d\) Os2Pt2.pdos.out.pdos_atm#10\\(Os\\)*\(d\) Os2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Os2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Os2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pt2Au2.pdos.out.pdos_atm#5\\(Pt\\)*\(d\) Pt2Au2.pdos.out.pdos_atm#6\\(Pt\\)*\(d\) Pt2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Pt2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Pt2Au2.pdos.out.pdos_atm#9\\(Pt\\)*\(d\) Pt2Au2.pdos.out.pdos_atm#10\\(Pt\\)*\(d\) Pt2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Pt2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pt2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pt2Hg2.pdos.out.pdos_atm#5\\(Pt\\)*\(d\) Pt2Hg2.pdos.out.pdos_atm#6\\(Pt\\)*\(d\) Pt2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Pt2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Pt2Hg2.pdos.out.pdos_atm#9\\(Pt\\)*\(d\) Pt2Hg2.pdos.out.pdos_atm#10\\(Pt\\)*\(d\) Pt2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Pt2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pt2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Re2Au2.pdos.out.pdos_atm#5\\(Re\\)*\(d\) Re2Au2.pdos.out.pdos_atm#6\\(Re\\)*\(d\) Re2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Re2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Re2Au2.pdos.out.pdos_atm#9\\(Re\\)*\(d\) Re2Au2.pdos.out.pdos_atm#10\\(Re\\)*\(d\) Re2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Re2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Re2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

sleep 10

STR="Re2Os2.pdos.out.pdos_atm#5\\(Re\\)*\(d\) Re2Os2.pdos.out.pdos_atm#6\\(Re\\)*\(d\) Re2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Re2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Re2Os2.pdos.out.pdos_atm#9\\(Re\\)*\(d\) Re2Os2.pdos.out.pdos_atm#10\\(Re\\)*\(d\) Re2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Re2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Re2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Re2Pt2.pdos.out.pdos_atm#5\\(Re\\)*\(d\) Re2Pt2.pdos.out.pdos_atm#6\\(Re\\)*\(d\) Re2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Re2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Re2Pt2.pdos.out.pdos_atm#9\\(Re\\)*\(d\) Re2Pt2.pdos.out.pdos_atm#10\\(Re\\)*\(d\) Re2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Re2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Re2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Pt2.pdos.out.pdos_atm#5\\(Rh\\)*\(d\) Rh2Pt2.pdos.out.pdos_atm#6\\(Rh\\)*\(d\) Rh2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Rh2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Rh2Pt2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Pt2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Rh2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Re2.pdos.out.pdos_atm#5\\(Rh\\)*\(d\) Rh2Re2.pdos.out.pdos_atm#6\\(Rh\\)*\(d\) Rh2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Rh2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Rh2Re2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Re2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Rh2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Pt2.pdos.out.pdos_atm#5\\(Ru\\)*\(d\) Ru2Pt2.pdos.out.pdos_atm#6\\(Ru\\)*\(d\) Ru2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Ru2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Ru2Pt2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Pt2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Ru2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Re2.pdos.out.pdos_atm#5\\(Ru\\)*\(d\) Ru2Re2.pdos.out.pdos_atm#6\\(Ru\\)*\(d\) Ru2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Ru2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Ru2Re2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Re2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Ru2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Pt2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Pt2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Sc2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Sc2Pt2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Pt2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Sc2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Re2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Re2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Sc2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Sc2Re2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Re2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Sc2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Ti2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Ti2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Ti2.pdos.out.pdos_atm#7\\(Ti\\)*\(d\) Sc2Ti2.pdos.out.pdos_atm#8\\(Ti\\)*\(d\) Sc2Ti2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ti2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ti2.pdos.out.pdos_atm#11\\(Ti\\)*\(d\) Sc2Ti2.pdos.out.pdos_atm#12\\(Ti\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ti2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Ag2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Ag2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Ti2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Ti2Ag2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Ag2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ti2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Au2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Au2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Ti2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Ti2Au2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Au2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ti2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Cd2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Cd2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Ti2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Ti2Cd2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Cd2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Ti2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Cr2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Cr2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Cr2.pdos.out.pdos_atm#7\\(Cr\\)*\(d\) Ti2Cr2.pdos.out.pdos_atm#8\\(Cr\\)*\(d\) Ti2Cr2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Cr2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Cr2.pdos.out.pdos_atm#11\\(Cr\\)*\(d\) Ti2Cr2.pdos.out.pdos_atm#12\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Cr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Cu2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Cu2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Cu2.pdos.out.pdos_atm#7\\(Cu\\)*\(d\) Ti2Cu2.pdos.out.pdos_atm#8\\(Cu\\)*\(d\) Ti2Cu2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Cu2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Cu2.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Ti2Cu2.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Cu2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Hg2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Hg2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Ti2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Ti2Hg2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Hg2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Ti2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Mo2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Mo2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Mo2.pdos.out.pdos_atm#7\\(Mo\\)*\(d\) Ti2Mo2.pdos.out.pdos_atm#8\\(Mo\\)*\(d\) Ti2Mo2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Mo2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Ti2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Mo2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Nb2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Nb2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Nb2.pdos.out.pdos_atm#7\\(Nb\\)*\(d\) Ti2Nb2.pdos.out.pdos_atm#8\\(Nb\\)*\(d\) Ti2Nb2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Nb2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Ti2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Nb2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Os2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Os2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Ti2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Ti2Os2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Os2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Ti2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Pt2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Pt2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Ti2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Ti2Pt2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Pt2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Ti2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Re2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Re2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Ti2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Ti2Re2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Re2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Ti2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Rh2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Rh2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Ti2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Ti2Rh2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Rh2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Ti2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Ru2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Ru2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Ru2.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) Ti2Ru2.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) Ti2Ru2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Ru2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Ti2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Ru2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Y2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Y2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Ti2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Ti2Y2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Y2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Ti2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Zn2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Zn2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Zr2.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti2Zr2.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti2Zr2.pdos.out.pdos_atm#7\\(Zr\\)*\(d\) Ti2Zr2.pdos.out.pdos_atm#8\\(Zr\\)*\(d\) Ti2Zr2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Zr2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Ti2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Zr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Y2Pt2.pdos.out.pdos_atm#5\\(Y\\)*\(d\) Y2Pt2.pdos.out.pdos_atm#6\\(Y\\)*\(d\) Y2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Y2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Y2Pt2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Pt2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Y2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Y2Re2.pdos.out.pdos_atm#5\\(Y\\)*\(d\) Y2Re2.pdos.out.pdos_atm#6\\(Y\\)*\(d\) Y2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Y2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Y2Re2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Re2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Y2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Re2_two-layers_\(d\).dat`"
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

STR="Zr2Pt2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Pt2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Zr2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Zr2Pt2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Pt2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Zr2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Re2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Re2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Re2.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Zr2Re2.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Zr2Re2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Re2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Zr2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Re2_two-layers_\(d\).dat`"
echo $STR

sleep 10

