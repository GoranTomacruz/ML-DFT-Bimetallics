./2022July04_16/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-16.2-##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.16.out     ##CHANGE
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
pp.x      -i Fe2Pd2-pp.in &&
dos.x     -i Fe2Pd2-dos.in &&
average.x -i Fe2Pd2-wf.ave.in > Fe2Pd2-wf.ave.out &&
mv avg.dat Fe2Pd2-avg.dat &&
sleep 10

projwfc.x -i Fe2Pd2-pdos.in &&
sleep 5

pp.x      -i Fe2Pt2-pp.in &&
dos.x     -i Fe2Pt2-dos.in &&
average.x -i Fe2Pt2-wf.ave.in > Fe2Pt2-wf.ave.out &&
mv avg.dat Fe2Pt2-avg.dat &&
sleep 10

projwfc.x -i Fe2Pt2-pdos.in &&
sleep 5

pp.x      -i Fe2Rh2-pp.in &&
dos.x     -i Fe2Rh2-dos.in &&
average.x -i Fe2Rh2-wf.ave.in > Fe2Rh2-wf.ave.out &&
mv avg.dat Fe2Rh2-avg.dat &&
sleep 10

projwfc.x -i Fe2Rh2-pdos.in &&
sleep 5

