#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP2-4.3##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July11files.4.3.out     ##CHANGE
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
pp.x      -i Cu2Nb2-pp.in > Cu2Nb2-pp.out &&
dos.x     -i Cu2Nb2-dos.in > Cu2Nb2-dos.out &&
average.x -i Cu2Nb2-wf.ave.in > Cu2Nb2-wf.ave.out &&
mv avg.dat Cu2Nb2-avg.dat &&
projwfc.x -i Cu2Nb2-pdos.in > Cu2Nb2-pdos.out &&
sleep 10

pp.x      -i Cu2Os2-pp.in > Cu2Os2-pp.out &&
dos.x     -i Cu2Os2-dos.in > Cu2Os2-dos.out &&
average.x -i Cu2Os2-wf.ave.in > Cu2Os2-wf.ave.out &&
mv avg.dat Cu2Os2-avg.dat &&
projwfc.x -i Cu2Os2-pdos.in > Cu2Os2-pdos.out &&
sleep 10

pp.x      -i Cu2Rh2-pp.in > Cu2Rh2-pp.out &&
dos.x     -i Cu2Rh2-dos.in > Cu2Rh2-dos.out &&
average.x -i Cu2Rh2-wf.ave.in > Cu2Rh2-wf.ave.out &&
mv avg.dat Cu2Rh2-avg.dat &&
projwfc.x -i Cu2Rh2-pdos.in > Cu2Rh2-pdos.out &&
sleep 10

pp.x      -i Cu2Ru2-pp.in > Cu2Ru2-pp.out &&
dos.x     -i Cu2Ru2-dos.in > Cu2Ru2-dos.out &&
average.x -i Cu2Ru2-wf.ave.in > Cu2Ru2-wf.ave.out &&
mv avg.dat Cu2Ru2-avg.dat &&
projwfc.x -i Cu2Ru2-pdos.in > Cu2Ru2-pdos.out &&
sleep 10

pp.x      -i Cu2Y2-pp.in > Cu2Y2-pp.out &&
dos.x     -i Cu2Y2-dos.in > Cu2Y2-dos.out &&
average.x -i Cu2Y2-wf.ave.in > Cu2Y2-wf.ave.out &&
mv avg.dat Cu2Y2-avg.dat &&
projwfc.x -i Cu2Y2-pdos.in > Cu2Y2-pdos.out &&
sleep 10

pp.x      -i Ru2Os2-pp.in > Ru2Os2-pp.out &&
dos.x     -i Ru2Os2-dos.in > Ru2Os2-dos.out &&
average.x -i Ru2Os2-wf.ave.in > Ru2Os2-wf.ave.out &&
mv avg.dat Ru2Os2-avg.dat &&
projwfc.x -i Ru2Os2-pdos.in > Ru2Os2-pdos.out &&
sleep 10

pp.x      -i Ru2Rh2-pp.in > Ru2Rh2-pp.out &&
dos.x     -i Ru2Rh2-dos.in > Ru2Rh2-dos.out &&
average.x -i Ru2Rh2-wf.ave.in > Ru2Rh2-wf.ave.out &&
mv avg.dat Ru2Rh2-avg.dat &&
projwfc.x -i Ru2Rh2-pdos.in > Ru2Rh2-pdos.out &&
sleep 10

pp.x      -i Ru2Y2-pp.in > Ru2Y2-pp.out &&
dos.x     -i Ru2Y2-dos.in > Ru2Y2-dos.out &&
average.x -i Ru2Y2-wf.ave.in > Ru2Y2-wf.ave.out &&
mv avg.dat Ru2Y2-avg.dat &&
projwfc.x -i Ru2Y2-pdos.in > Ru2Y2-pdos.out &&
sleep 10

pp.x      -i Sc2Ag2-pp.in > Sc2Ag2-pp.out &&
dos.x     -i Sc2Ag2-dos.in > Sc2Ag2-dos.out &&
average.x -i Sc2Ag2-wf.ave.in > Sc2Ag2-wf.ave.out &&
mv avg.dat Sc2Ag2-avg.dat &&
projwfc.x -i Sc2Ag2-pdos.in > Sc2Ag2-pdos.out &&
sleep 10

pp.x      -i Sc2Cu2-pp.in > Sc2Cu2-pp.out &&
dos.x     -i Sc2Cu2-dos.in > Sc2Cu2-dos.out &&
average.x -i Sc2Cu2-wf.ave.in > Sc2Cu2-wf.ave.out &&
mv avg.dat Sc2Cu2-avg.dat &&
projwfc.x -i Sc2Cu2-pdos.in > Sc2Cu2-pdos.out &&
sleep 10

pp.x      -i Sc2Ru2-pp.in > Sc2Ru2-pp.out &&
dos.x     -i Sc2Ru2-dos.in > Sc2Ru2-dos.out &&
average.x -i Sc2Ru2-wf.ave.in > Sc2Ru2-wf.ave.out &&
mv avg.dat Sc2Ru2-avg.dat &&
projwfc.x -i Sc2Ru2-pdos.in > Sc2Ru2-pdos.out &&
sleep 10

pp.x      -i Zr2Ag2-pp.in > Zr2Ag2-pp.out &&
dos.x     -i Zr2Ag2-dos.in > Zr2Ag2-dos.out &&
average.x -i Zr2Ag2-wf.ave.in > Zr2Ag2-wf.ave.out &&
mv avg.dat Zr2Ag2-avg.dat &&
projwfc.x -i Zr2Ag2-pdos.in > Zr2Ag2-pdos.out &&
sleep 10

pp.x      -i Zr2Ru2-pp.in > Zr2Ru2-pp.out &&
dos.x     -i Zr2Ru2-dos.in > Zr2Ru2-dos.out &&
average.x -i Zr2Ru2-wf.ave.in > Zr2Ru2-wf.ave.out &&
mv avg.dat Zr2Ru2-avg.dat &&
projwfc.x -i Zr2Ru2-pdos.in > Zr2Ru2-pdos.out &&
sleep 10

