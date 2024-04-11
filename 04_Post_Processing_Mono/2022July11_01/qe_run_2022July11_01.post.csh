#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PPm-01##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July11files.01.out     ##CHANGE
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
pp.x      -i La-pp.in > La-pp.out &&
dos.x     -i La-dos.in > La-dos.out &&
average.x -i La-wf.ave.in > La-wf.ave.out &&
mv avg.dat La-avg.dat &&
projwfc.x -i La-pdos.in > La-pdos.out &&
sleep 10

pp.x      -i Mo-pp.in > Mo-pp.out &&
dos.x     -i Mo-dos.in > Mo-dos.out &&
average.x -i Mo-wf.ave.in > Mo-wf.ave.out &&
mv avg.dat Mo-avg.dat &&
projwfc.x -i Mo-pdos.in > Mo-pdos.out &&
sleep 10

pp.x      -i Nb-pp.in > Nb-pp.out &&
dos.x     -i Nb-dos.in > Nb-dos.out &&
average.x -i Nb-wf.ave.in > Nb-wf.ave.out &&
mv avg.dat Nb-avg.dat &&
projwfc.x -i Nb-pdos.in > Nb-pdos.out &&
sleep 10

pp.x      -i Os-pp.in > Os-pp.out &&
dos.x     -i Os-dos.in > Os-dos.out &&
average.x -i Os-wf.ave.in > Os-wf.ave.out &&
mv avg.dat Os-avg.dat &&
projwfc.x -i Os-pdos.in > Os-pdos.out &&
sleep 10

pp.x      -i Pd-pp.in > Pd-pp.out &&
dos.x     -i Pd-dos.in > Pd-dos.out &&
average.x -i Pd-wf.ave.in > Pd-wf.ave.out &&
mv avg.dat Pd-avg.dat &&
projwfc.x -i Pd-pdos.in > Pd-pdos.out &&
sleep 10

pp.x      -i Pt-pp.in > Pt-pp.out &&
dos.x     -i Pt-dos.in > Pt-dos.out &&
average.x -i Pt-wf.ave.in > Pt-wf.ave.out &&
mv avg.dat Pt-avg.dat &&
projwfc.x -i Pt-pdos.in > Pt-pdos.out &&
sleep 10

pp.x      -i Re-pp.in > Re-pp.out &&
dos.x     -i Re-dos.in > Re-dos.out &&
average.x -i Re-wf.ave.in > Re-wf.ave.out &&
mv avg.dat Re-avg.dat &&
projwfc.x -i Re-pdos.in > Re-pdos.out &&
sleep 10

pp.x      -i Rh-pp.in > Rh-pp.out &&
dos.x     -i Rh-dos.in > Rh-dos.out &&
average.x -i Rh-wf.ave.in > Rh-wf.ave.out &&
mv avg.dat Rh-avg.dat &&
projwfc.x -i Rh-pdos.in > Rh-pdos.out &&
sleep 10

pp.x      -i Ru-pp.in > Ru-pp.out &&
dos.x     -i Ru-dos.in > Ru-dos.out &&
average.x -i Ru-wf.ave.in > Ru-wf.ave.out &&
mv avg.dat Ru-avg.dat &&
projwfc.x -i Ru-pdos.in > Ru-pdos.out &&
sleep 10

