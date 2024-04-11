./2022July04_17/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-17##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.17.out     ##CHANGE
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
pp.x      -i Fe2Ru2-pp.in &&
dos.x     -i Fe2Ru2-dos.in &&
average.x -i Fe2Ru2-wf.ave.in > Fe2Ru2-wf.ave.out &&
mv avg.dat Fe2Ru2-avg.dat &&
sleep 10

projwfc.x -i Fe2Ru2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Ru.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Ru2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Fe2Ta2-pp.in &&
dos.x     -i Fe2Ta2-dos.in &&
average.x -i Fe2Ta2-wf.ave.in > Fe2Ta2-wf.ave.out &&
mv avg.dat Fe2Ta2-avg.dat &&
sleep 10

projwfc.x -i Fe2Ta2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Ta2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Fe2Tc2-pp.in &&
dos.x     -i Fe2Tc2-dos.in &&
average.x -i Fe2Tc2-wf.ave.in > Fe2Tc2-wf.ave.out &&
mv avg.dat Fe2Tc2-avg.dat &&
sleep 10

projwfc.x -i Fe2Tc2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Tc.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Tc2_top_layer_\(d\).dat`"
echo $STR

