#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-12##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.12.out     ##CHANGE
#SBATCH --error=2022July17files.12.err     ##CHANGE
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
STR="Co2Fe2.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co2Fe2.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co2Fe2.pdos.out.pdos_atm#7\\(Fe\\)*\(d\) Co2Fe2.pdos.out.pdos_atm#8\\(Fe\\)*\(d\) Co2Fe2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Fe2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Fe2.pdos.out.pdos_atm#11\\(Fe\\)*\(d\) Co2Fe2.pdos.out.pdos_atm#12\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Fe2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Fe2.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#7\\(Fe\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#8\\(Fe\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#11\\(Fe\\)*\(d\) Cr2Fe2.pdos.out.pdos_atm#12\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Fe2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2La2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2La2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2La2.pdos.out.pdos_atm#7\\(La\\)*\(d\) Fe2La2.pdos.out.pdos_atm#8\\(La\\)*\(d\) Fe2La2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2La2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Fe2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2La2_two-layers_\(d\).dat`"
echo $STR

sleep 10

