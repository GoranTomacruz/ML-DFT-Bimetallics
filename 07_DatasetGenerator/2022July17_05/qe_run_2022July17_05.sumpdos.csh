#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-05##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.05.out     ##CHANGE
#SBATCH --error=2022July17files.05.err     ##CHANGE
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
STR="Au2Hg2.pdos.out.pdos_atm#5\\(Au\\)*\(d\) Au2Hg2.pdos.out.pdos_atm#6\\(Au\\)*\(d\) Au2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Au2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Au2Hg2.pdos.out.pdos_atm#9\\(Au\\)*\(d\) Au2Hg2.pdos.out.pdos_atm#10\\(Au\\)*\(d\) Au2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Au2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Au2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cd2Hg2.pdos.out.pdos_atm#5\\(Cd\\)*\(d\) Cd2Hg2.pdos.out.pdos_atm#6\\(Cd\\)*\(d\) Cd2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Cd2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Cd2Hg2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Hg2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Cd2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cd2Os2.pdos.out.pdos_atm#5\\(Cd\\)*\(d\) Cd2Os2.pdos.out.pdos_atm#6\\(Cd\\)*\(d\) Cd2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Cd2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Cd2Os2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Os2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Cd2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cd2Y2.pdos.out.pdos_atm#5\\(Cd\\)*\(d\) Cd2Y2.pdos.out.pdos_atm#6\\(Cd\\)*\(d\) Cd2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Cd2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Cd2Y2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Y2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Cd2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

sleep 10

STR="Cr2Nb2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Nb2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Nb2.pdos.out.pdos_atm#7\\(Nb\\)*\(d\) Cr2Nb2.pdos.out.pdos_atm#8\\(Nb\\)*\(d\) Cr2Nb2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Nb2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Cr2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Nb2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Os2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Os2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Cr2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Cr2Os2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Os2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Cr2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Y2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Y2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Cr2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Cr2Y2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Y2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Cr2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Hg2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2Hg2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Mo2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Mo2Hg2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Hg2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Mo2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Os2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2Os2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Mo2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Mo2Os2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Os2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Mo2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Y2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2Y2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Mo2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Mo2Y2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Y2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Mo2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Au2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Au2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Nb2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Nb2Au2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Au2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Nb2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Cd2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Cd2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Nb2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Nb2Cd2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Cd2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Nb2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Hg2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Hg2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Nb2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Nb2Hg2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Hg2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Nb2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Mo2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Mo2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Mo2.pdos.out.pdos_atm#7\\(Mo\\)*\(d\) Nb2Mo2.pdos.out.pdos_atm#8\\(Mo\\)*\(d\) Nb2Mo2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Mo2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Nb2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Mo2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Os2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Os2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Nb2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Nb2Os2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Os2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Nb2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Rh2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Rh2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Nb2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Nb2Rh2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Rh2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Nb2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Y2.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb2Y2.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Nb2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Nb2Y2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Y2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Nb2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

sleep 10

sleep 10

STR="Rh2Hg2.pdos.out.pdos_atm#5\\(Rh\\)*\(d\) Rh2Hg2.pdos.out.pdos_atm#6\\(Rh\\)*\(d\) Rh2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Rh2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Rh2Hg2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Hg2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Rh2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Os2.pdos.out.pdos_atm#5\\(Rh\\)*\(d\) Rh2Os2.pdos.out.pdos_atm#6\\(Rh\\)*\(d\) Rh2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Rh2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Rh2Os2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Os2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Rh2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Y2.pdos.out.pdos_atm#5\\(Rh\\)*\(d\) Rh2Y2.pdos.out.pdos_atm#6\\(Rh\\)*\(d\) Rh2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Rh2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Rh2Y2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Y2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Rh2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Hg2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Hg2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Sc2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Sc2Hg2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Hg2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Sc2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Nb2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Nb2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Nb2.pdos.out.pdos_atm#7\\(Nb\\)*\(d\) Sc2Nb2.pdos.out.pdos_atm#8\\(Nb\\)*\(d\) Sc2Nb2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Nb2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Sc2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Nb2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Os2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Os2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Sc2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Sc2Os2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Os2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Sc2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Y2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Y2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Sc2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Sc2Y2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Y2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Sc2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Y2Au2.pdos.out.pdos_atm#5\\(Y\\)*\(d\) Y2Au2.pdos.out.pdos_atm#6\\(Y\\)*\(d\) Y2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Y2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Y2Au2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Au2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Y2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Y2Hg2.pdos.out.pdos_atm#5\\(Y\\)*\(d\) Y2Hg2.pdos.out.pdos_atm#6\\(Y\\)*\(d\) Y2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Y2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Y2Hg2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Hg2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Y2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Y2Os2.pdos.out.pdos_atm#5\\(Y\\)*\(d\) Y2Os2.pdos.out.pdos_atm#6\\(Y\\)*\(d\) Y2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Y2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Y2Os2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Os2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Y2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Hg2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Hg2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Hg2.pdos.out.pdos_atm#7\\(Hg\\)*\(d\) Zr2Hg2.pdos.out.pdos_atm#8\\(Hg\\)*\(d\) Zr2Hg2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Hg2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Hg2.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Zr2Hg2.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Hg2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Nb2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Nb2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Nb2.pdos.out.pdos_atm#7\\(Nb\\)*\(d\) Zr2Nb2.pdos.out.pdos_atm#8\\(Nb\\)*\(d\) Zr2Nb2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Nb2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Zr2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Nb2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Os2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Os2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Os2.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Zr2Os2.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Zr2Os2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Os2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Zr2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Os2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Y2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Y2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Y2.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Zr2Y2.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Zr2Y2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Y2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Zr2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Y2_two-layers_\(d\).dat`"
echo $STR

sleep 10

