#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP2-6.3##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July11files.6.3.out     ##CHANGE
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
pp.x      -i Mo2Rh2-pp.in > Mo2Rh2-pp.out &&
dos.x     -i Mo2Rh2-dos.in > Mo2Rh2-dos.out &&
average.x -i Mo2Rh2-wf.ave.in > Mo2Rh2-wf.ave.out &&
mv avg.dat Mo2Rh2-avg.dat &&
projwfc.x -i Mo2Rh2-pdos.in > Mo2Rh2-pdos.out &&
sleep 10

pp.x      -i Rh2Au2-pp.in > Rh2Au2-pp.out &&
dos.x     -i Rh2Au2-dos.in > Rh2Au2-dos.out &&
average.x -i Rh2Au2-wf.ave.in > Rh2Au2-wf.ave.out &&
mv avg.dat Rh2Au2-avg.dat &&
projwfc.x -i Rh2Au2-pdos.in > Rh2Au2-pdos.out &&
sleep 10

pp.x      -i Zr2Cd2-pp.in > Zr2Cd2-pp.out &&
dos.x     -i Zr2Cd2-dos.in > Zr2Cd2-dos.out &&
average.x -i Zr2Cd2-wf.ave.in > Zr2Cd2-wf.ave.out &&
mv avg.dat Zr2Cd2-avg.dat &&
projwfc.x -i Zr2Cd2-pdos.in > Zr2Cd2-pdos.out &&
sleep 10

pp.x      -i Zr2Mo2-pp.in > Zr2Mo2-pp.out &&
dos.x     -i Zr2Mo2-dos.in > Zr2Mo2-dos.out &&
average.x -i Zr2Mo2-wf.ave.in > Zr2Mo2-wf.ave.out &&
mv avg.dat Zr2Mo2-avg.dat &&
projwfc.x -i Zr2Mo2-pdos.in > Zr2Mo2-pdos.out &&
sleep 10

pp.x      -i Zr2Rh2-pp.in > Zr2Rh2-pp.out &&
dos.x     -i Zr2Rh2-dos.in > Zr2Rh2-dos.out &&
average.x -i Zr2Rh2-wf.ave.in > Zr2Rh2-wf.ave.out &&
mv avg.dat Zr2Rh2-avg.dat &&
projwfc.x -i Zr2Rh2-pdos.in > Zr2Rh2-pdos.out &&
sleep 10

