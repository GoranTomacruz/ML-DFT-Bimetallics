#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-13##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.13.out     ##CHANGE
#SBATCH --error=2022July17files.13.err     ##CHANGE
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
STR="Fe2Ag2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2Ag2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2Ag2.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Fe2Ag2.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Fe2Ag2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Ag2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Fe2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Ag2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Au2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2Au2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2Au2.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Fe2Au2.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Fe2Au2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Au2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Fe2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Au2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Cd2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2Cd2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2Cd2.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Fe2Cd2.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Fe2Cd2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Cd2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Fe2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Cd2_two-layers_\(d\).dat`"
echo $STR

sleep 10
