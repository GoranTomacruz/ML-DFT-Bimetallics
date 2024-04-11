#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-16##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.16.out     ##CHANGE
#SBATCH --error=2022July17files.16.err     ##CHANGE
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
STR="Fe2Pd2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2Pd2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2Pd2.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Fe2Pd2.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Fe2Pd2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Pd2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Fe2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Pd2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Pt2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2Pt2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2Pt2.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Fe2Pt2.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Fe2Pt2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Pt2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Fe2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Pt2_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Rh2.pdos.out.pdos_atm#5\\(Fe\\)*\(d\) Fe2Rh2.pdos.out.pdos_atm#6\\(Fe\\)*\(d\) Fe2Rh2.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Fe2Rh2.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Fe2Rh2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Rh2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Fe2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Rh2_two-layers_\(d\).dat`"
echo $STR

sleep 10

