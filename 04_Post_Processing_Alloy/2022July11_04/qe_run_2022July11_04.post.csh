#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP2-04##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July11files.04.out     ##CHANGE
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
pp.x      -i Ag2Au2-pp.in > Ag2Au2-pp.out &&
dos.x     -i Ag2Au2-dos.in > Ag2Au2-dos.out &&
average.x -i Ag2Au2-wf.ave.in > Ag2Au2-wf.ave.out &&
mv avg.dat Ag2Au2-avg.dat &&
projwfc.x -i Ag2Au2-pdos.in > Ag2Au2-pdos.out &&
sleep 10

pp.x      -i Ag2Cd2-pp.in > Ag2Cd2-pp.out &&
dos.x     -i Ag2Cd2-dos.in > Ag2Cd2-dos.out &&
average.x -i Ag2Cd2-wf.ave.in > Ag2Cd2-wf.ave.out &&
mv avg.dat Ag2Cd2-avg.dat &&
projwfc.x -i Ag2Cd2-pdos.in > Ag2Cd2-pdos.out &&
sleep 10

pp.x      -i Ag2Hg2-pp.in > Ag2Hg2-pp.out &&
dos.x     -i Ag2Hg2-dos.in > Ag2Hg2-dos.out &&
average.x -i Ag2Hg2-wf.ave.in > Ag2Hg2-wf.ave.out &&
mv avg.dat Ag2Hg2-avg.dat &&
projwfc.x -i Ag2Hg2-pdos.in > Ag2Hg2-pdos.out &&
sleep 10

pp.x      -i Ag2Os2-pp.in > Ag2Os2-pp.out &&
dos.x     -i Ag2Os2-dos.in > Ag2Os2-dos.out &&
average.x -i Ag2Os2-wf.ave.in > Ag2Os2-wf.ave.out &&
mv avg.dat Ag2Os2-avg.dat &&
projwfc.x -i Ag2Os2-pdos.in > Ag2Os2-pdos.out &&
sleep 10

pp.x      -i Ag2Y2-pp.in > Ag2Y2-pp.out &&
dos.x     -i Ag2Y2-dos.in > Ag2Y2-dos.out &&
average.x -i Ag2Y2-wf.ave.in > Ag2Y2-wf.ave.out &&
mv avg.dat Ag2Y2-avg.dat &&
projwfc.x -i Ag2Y2-pdos.in > Ag2Y2-pdos.out &&
sleep 10

pp.x      -i Cr2Ag2-pp.in > Cr2Ag2-pp.out &&
dos.x     -i Cr2Ag2-dos.in > Cr2Ag2-dos.out &&
average.x -i Cr2Ag2-wf.ave.in > Cr2Ag2-wf.ave.out &&
mv avg.dat Cr2Ag2-avg.dat &&
projwfc.x -i Cr2Ag2-pdos.in > Cr2Ag2-pdos.out &&
sleep 10

pp.x      -i Cr2Cu2-pp.in > Cr2Cu2-pp.out &&
dos.x     -i Cr2Cu2-dos.in > Cr2Cu2-dos.out &&
average.x -i Cr2Cu2-wf.ave.in > Cr2Cu2-wf.ave.out &&
mv avg.dat Cr2Cu2-avg.dat &&
projwfc.x -i Cr2Cu2-pdos.in > Cr2Cu2-pdos.out &&
sleep 10

pp.x      -i Cr2Ru2-pp.in > Cr2Ru2-pp.out &&
dos.x     -i Cr2Ru2-dos.in > Cr2Ru2-dos.out &&
average.x -i Cr2Ru2-wf.ave.in > Cr2Ru2-wf.ave.out &&
mv avg.dat Cr2Ru2-avg.dat &&
projwfc.x -i Cr2Ru2-pdos.in > Cr2Ru2-pdos.out &&
sleep 10

pp.x      -i Cu2Ag2-pp.in > Cu2Ag2-pp.out &&
dos.x     -i Cu2Ag2-dos.in > Cu2Ag2-dos.out &&
average.x -i Cu2Ag2-wf.ave.in > Cu2Ag2-wf.ave.out &&
mv avg.dat Cu2Ag2-avg.dat &&
projwfc.x -i Cu2Ag2-pdos.in > Cu2Ag2-pdos.out &&
sleep 10

pp.x      -i Cu2Au2-pp.in > Cu2Au2-pp.out &&
dos.x     -i Cu2Au2-dos.in > Cu2Au2-dos.out &&
average.x -i Cu2Au2-wf.ave.in > Cu2Au2-wf.ave.out &&
mv avg.dat Cu2Au2-avg.dat &&
projwfc.x -i Cu2Au2-pdos.in > Cu2Au2-pdos.out &&
sleep 10

pp.x      -i Cu2Cd2-pp.in > Cu2Cd2-pp.out &&
dos.x     -i Cu2Cd2-dos.in > Cu2Cd2-dos.out &&
average.x -i Cu2Cd2-wf.ave.in > Cu2Cd2-wf.ave.out &&
mv avg.dat Cu2Cd2-avg.dat &&
projwfc.x -i Cu2Cd2-pdos.in > Cu2Cd2-pdos.out &&
sleep 10

pp.x      -i Cu2Hg2-pp.in > Cu2Hg2-pp.out &&
dos.x     -i Cu2Hg2-dos.in > Cu2Hg2-dos.out &&
average.x -i Cu2Hg2-wf.ave.in > Cu2Hg2-wf.ave.out &&
mv avg.dat Cu2Hg2-avg.dat &&
projwfc.x -i Cu2Hg2-pdos.in > Cu2Hg2-pdos.out &&
sleep 10

pp.x      -i Cu2Mo2-pp.in > Cu2Mo2-pp.out &&
dos.x     -i Cu2Mo2-dos.in > Cu2Mo2-dos.out &&
average.x -i Cu2Mo2-wf.ave.in > Cu2Mo2-wf.ave.out &&
mv avg.dat Cu2Mo2-avg.dat &&
projwfc.x -i Cu2Mo2-pdos.in > Cu2Mo2-pdos.out &&
sleep 10

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

pp.x      -i Cu2Zr2-pp.in > Cu2Zr2-pp.out &&
dos.x     -i Cu2Zr2-dos.in > Cu2Zr2-dos.out &&
average.x -i Cu2Zr2-wf.ave.in > Cu2Zr2-wf.ave.out &&
mv avg.dat Cu2Zr2-avg.dat &&
projwfc.x -i Cu2Zr2-pdos.in > Cu2Zr2-pdos.out &&
sleep 10

pp.x      -i Mo2Ag2-pp.in > Mo2Ag2-pp.out &&
dos.x     -i Mo2Ag2-dos.in > Mo2Ag2-dos.out &&
average.x -i Mo2Ag2-wf.ave.in > Mo2Ag2-wf.ave.out &&
mv avg.dat Mo2Ag2-avg.dat &&
projwfc.x -i Mo2Ag2-pdos.in > Mo2Ag2-pdos.out &&
sleep 10

pp.x      -i Mo2Ru2-pp.in > Mo2Ru2-pp.out &&
dos.x     -i Mo2Ru2-dos.in > Mo2Ru2-dos.out &&
average.x -i Mo2Ru2-wf.ave.in > Mo2Ru2-wf.ave.out &&
mv avg.dat Mo2Ru2-avg.dat &&
projwfc.x -i Mo2Ru2-pdos.in > Mo2Ru2-pdos.out &&
sleep 10

pp.x      -i Nb2Ag2-pp.in > Nb2Ag2-pp.out &&
dos.x     -i Nb2Ag2-dos.in > Nb2Ag2-dos.out &&
average.x -i Nb2Ag2-wf.ave.in > Nb2Ag2-wf.ave.out &&
mv avg.dat Nb2Ag2-avg.dat &&
projwfc.x -i Nb2Ag2-pdos.in > Nb2Ag2-pdos.out &&
sleep 10

pp.x      -i Nb2Ru2-pp.in > Nb2Ru2-pp.out &&
dos.x     -i Nb2Ru2-dos.in > Nb2Ru2-dos.out &&
average.x -i Nb2Ru2-wf.ave.in > Nb2Ru2-wf.ave.out &&
mv avg.dat Nb2Ru2-avg.dat &&
projwfc.x -i Nb2Ru2-pdos.in > Nb2Ru2-pdos.out &&
sleep 10

pp.x      -i Rh2Ag2-pp.in > Rh2Ag2-pp.out &&
dos.x     -i Rh2Ag2-dos.in > Rh2Ag2-dos.out &&
average.x -i Rh2Ag2-wf.ave.in > Rh2Ag2-wf.ave.out &&
mv avg.dat Rh2Ag2-avg.dat &&
projwfc.x -i Rh2Ag2-pdos.in > Rh2Ag2-pdos.out &&
sleep 10

pp.x      -i Ru2Ag2-pp.in > Ru2Ag2-pp.out &&
dos.x     -i Ru2Ag2-dos.in > Ru2Ag2-dos.out &&
average.x -i Ru2Ag2-wf.ave.in > Ru2Ag2-wf.ave.out &&
mv avg.dat Ru2Ag2-avg.dat &&
projwfc.x -i Ru2Ag2-pdos.in > Ru2Ag2-pdos.out &&
sleep 10

pp.x      -i Ru2Au2-pp.in > Ru2Au2-pp.out &&
dos.x     -i Ru2Au2-dos.in > Ru2Au2-dos.out &&
average.x -i Ru2Au2-wf.ave.in > Ru2Au2-wf.ave.out &&
mv avg.dat Ru2Au2-avg.dat &&
projwfc.x -i Ru2Au2-pdos.in > Ru2Au2-pdos.out &&
sleep 10

pp.x      -i Ru2Cd2-pp.in > Ru2Cd2-pp.out &&
dos.x     -i Ru2Cd2-dos.in > Ru2Cd2-dos.out &&
average.x -i Ru2Cd2-wf.ave.in > Ru2Cd2-wf.ave.out &&
mv avg.dat Ru2Cd2-avg.dat &&
projwfc.x -i Ru2Cd2-pdos.in > Ru2Cd2-pdos.out &&
sleep 10

pp.x      -i Ru2Hg2-pp.in > Ru2Hg2-pp.out &&
dos.x     -i Ru2Hg2-dos.in > Ru2Hg2-dos.out &&
average.x -i Ru2Hg2-wf.ave.in > Ru2Hg2-wf.ave.out &&
mv avg.dat Ru2Hg2-avg.dat &&
projwfc.x -i Ru2Hg2-pdos.in > Ru2Hg2-pdos.out &&
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

