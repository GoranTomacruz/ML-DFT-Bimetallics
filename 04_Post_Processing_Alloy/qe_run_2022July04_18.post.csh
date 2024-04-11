./2022July04_18/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-18##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.18.out     ##CHANGE
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
pp.x      -i Fe2Y2-pp.in &&
dos.x     -i Fe2Y2-dos.in &&
average.x -i Fe2Y2-wf.ave.in > Fe2Y2-wf.ave.out &&
mv avg.dat Fe2Y2-avg.dat &&
sleep 10

projwfc.x -i Fe2Y2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Fe2Zn2-pp.in &&
dos.x     -i Fe2Zn2-dos.in &&
average.x -i Fe2Zn2-wf.ave.in > Fe2Zn2-wf.ave.out &&
mv avg.dat Fe2Zn2-avg.dat &&
sleep 10

projwfc.x -i Fe2Zn2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Zn.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Zn2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Fe2Zr2-pp.in &&
dos.x     -i Fe2Zr2-dos.in &&
average.x -i Fe2Zr2-wf.ave.in > Fe2Zr2-wf.ave.out &&
mv avg.dat Fe2Zr2-avg.dat &&
sleep 10

projwfc.x -i Fe2Zr2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Zr.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Zr2_top_layer_\(d\).dat`"
echo $STR
