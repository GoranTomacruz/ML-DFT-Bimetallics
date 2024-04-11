#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-06##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.06.out     ##CHANGE
#SBATCH --error=2022July17files.06.err     ##CHANGE
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
STR="Cd2Au2.pdos.out.pdos_atm#5\\(Cd\\)*\(d\) Cd2Au2.pdos.out.pdos_atm#6\\(Cd\\)*\(d\) Cd2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Cd2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Cd2Au2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Au2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Cd2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Au2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Au2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Cr2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Cr2Au2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Au2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Cr2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

sleep 10

STR="Cr2Mo2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Mo2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Mo2.pdos.out.pdos_atm#7\\(Mo\\)*\(d\) Cr2Mo2.pdos.out.pdos_atm#8\\(Mo\\)*\(d\) Cr2Mo2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Mo2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Cr2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Mo2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Rh2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Rh2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Cr2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Cr2Rh2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Rh2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Cr2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Zr2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Zr2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Zr2.pdos.out.pdos_atm#7\\(Zr\\)*\(d\) Cr2Zr2.pdos.out.pdos_atm#8\\(Zr\\)*\(d\) Cr2Zr2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Zr2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Cr2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Zr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Au2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2Au2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Mo2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Mo2Au2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Au2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Mo2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Cd2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2Cd2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Mo2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Mo2Cd2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Cd2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Mo2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Rh2.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo2Rh2.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Mo2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Mo2Rh2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Rh2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Mo2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Au2.pdos.out.pdos_atm#5\\(Rh\\)*\(d\) Rh2Au2.pdos.out.pdos_atm#6\\(Rh\\)*\(d\) Rh2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Rh2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Rh2Au2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Au2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Rh2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Cd2.pdos.out.pdos_atm#5\\(Rh\\)*\(d\) Rh2Cd2.pdos.out.pdos_atm#6\\(Rh\\)*\(d\) Rh2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Rh2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Rh2Cd2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Cd2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Rh2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Au2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Au2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Sc2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Sc2Au2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Au2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Sc2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Cd2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Cd2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Sc2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Sc2Cd2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Cd2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Sc2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Cr2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Cr2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Cr2.pdos.out.pdos_atm#7\\(Cr\\)*\(d\) Sc2Cr2.pdos.out.pdos_atm#8\\(Cr\\)*\(d\) Sc2Cr2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Cr2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Cr2.pdos.out.pdos_atm#11\\(Cr\\)*\(d\) Sc2Cr2.pdos.out.pdos_atm#12\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Cr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Mo2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Mo2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Mo2.pdos.out.pdos_atm#7\\(Mo\\)*\(d\) Sc2Mo2.pdos.out.pdos_atm#8\\(Mo\\)*\(d\) Sc2Mo2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Mo2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Sc2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Mo2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Rh2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Rh2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Sc2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Sc2Rh2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Rh2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Sc2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Zr2.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc2Zr2.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc2Zr2.pdos.out.pdos_atm#7\\(Zr\\)*\(d\) Sc2Zr2.pdos.out.pdos_atm#8\\(Zr\\)*\(d\) Sc2Zr2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Zr2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Sc2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Zr2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Au2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Au2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Zr2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Zr2Au2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Au2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Zr2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Cd2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Cd2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Zr2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Zr2Cd2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Cd2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Zr2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Mo2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Mo2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Mo2.pdos.out.pdos_atm#7\\(Mo\\)*\(d\) Zr2Mo2.pdos.out.pdos_atm#8\\(Mo\\)*\(d\) Zr2Mo2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Mo2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Zr2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Mo2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Rh2.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr2Rh2.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Zr2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Zr2Rh2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Rh2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Zr2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

