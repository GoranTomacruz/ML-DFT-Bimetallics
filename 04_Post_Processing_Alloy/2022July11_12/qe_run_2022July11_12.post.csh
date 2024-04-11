#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP2-12##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July11files.12.out     ##CHANGE
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
pp.x      -i Co2Fe2-pp.in > Co2Fe2-pp.out &&
dos.x     -i Co2Fe2-dos.in > Co2Fe2-dos.out &&
average.x -i Co2Fe2-wf.ave.in > Co2Fe2-wf.ave.out &&
mv avg.dat Co2Fe2-avg.dat &&
projwfc.x -i Co2Fe2-pdos.in > Co2Fe2-pdos.out &&
sleep 10

pp.x      -i Cr2Fe2-pp.in > Cr2Fe2-pp.out &&
dos.x     -i Cr2Fe2-dos.in > Cr2Fe2-dos.out &&
average.x -i Cr2Fe2-wf.ave.in > Cr2Fe2-wf.ave.out &&
mv avg.dat Cr2Fe2-avg.dat &&
projwfc.x -i Cr2Fe2-pdos.in > Cr2Fe2-pdos.out &&
sleep 10

pp.x      -i Fe2La2-pp.in > Fe2La2-pp.out &&
dos.x     -i Fe2La2-dos.in > Fe2La2-dos.out &&
average.x -i Fe2La2-wf.ave.in > Fe2La2-wf.ave.out &&
mv avg.dat Fe2La2-avg.dat &&
projwfc.x -i Fe2La2-pdos.in > Fe2La2-pdos.out &&
sleep 10
