./2022July04_13/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-13##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.13.out     ##CHANGE
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
pp.x      -i Fe2Ag2-pp.in &&
dos.x     -i Fe2Ag2-dos.in &&
average.x -i Fe2Ag2-wf.ave.in > Fe2Ag2-wf.ave.out &&
mv avg.dat Fe2Ag2-avg.dat &&
sleep 10

projwfc.x -i Fe2Ag2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Ag.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Ag2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Fe2Au2-pp.in &&
dos.x     -i Fe2Au2-dos.in &&
average.x -i Fe2Au2-wf.ave.in > Fe2Au2-wf.ave.out &&
mv avg.dat Fe2Au2-avg.dat &&
sleep 10

projwfc.x -i Fe2Au2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Fe2Cd2-pp.in &&
dos.x     -i Fe2Cd2-dos.in &&
average.x -i Fe2Cd2-wf.ave.in > Fe2Cd2-wf.ave.out &&
mv avg.dat Fe2Cd2-avg.dat &&
sleep 10

projwfc.x -i Fe2Cd2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Cd.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Cd2_top_layer_\(d\).dat`"
echo $STR

