#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP2-4.2##CHANGE
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
average.x -i Ag2Au2-wf.ave.in > Ag2Au2-wf.ave.out &&
mv avg.dat Ag2Au2-avg.dat &&
projwfc.x -i Ag2Au2-pdos.in > Ag2Au2-pdos.out &&
sleep 10

pp.x      -i Ag2Cd2-pp.in > Ag2Cd2-pp.out &&
average.x -i Ag2Cd2-wf.ave.in > Ag2Cd2-wf.ave.out &&
mv avg.dat Ag2Cd2-avg.dat &&
projwfc.x -i Ag2Cd2-pdos.in > Ag2Cd2-pdos.out &&
sleep 10

pp.x      -i Ag2Hg2-pp.in > Ag2Hg2-pp.out &&
average.x -i Ag2Hg2-wf.ave.in > Ag2Hg2-wf.ave.out &&
mv avg.dat Ag2Hg2-avg.dat &&
projwfc.x -i Ag2Hg2-pdos.in > Ag2Hg2-pdos.out &&
sleep 10

pp.x      -i Ag2Os2-pp.in > Ag2Os2-pp.out &&
average.x -i Ag2Os2-wf.ave.in > Ag2Os2-wf.ave.out &&
mv avg.dat Ag2Os2-avg.dat &&
projwfc.x -i Ag2Os2-pdos.in > Ag2Os2-pdos.out &&
sleep 10

pp.x      -i Ag2Y2-pp.in > Ag2Y2-pp.out &&
average.x -i Ag2Y2-wf.ave.in > Ag2Y2-wf.ave.out &&
mv avg.dat Ag2Y2-avg.dat &&
projwfc.x -i Ag2Y2-pdos.in > Ag2Y2-pdos.out &&
sleep 10

pp.x      -i Cr2Ag2-pp.in > Cr2Ag2-pp.out &&
average.x -i Cr2Ag2-wf.ave.in > Cr2Ag2-wf.ave.out &&
mv avg.dat Cr2Ag2-avg.dat &&
projwfc.x -i Cr2Ag2-pdos.in > Cr2Ag2-pdos.out &&
sleep 10

pp.x      -i Cr2Cu2-pp.in > Cr2Cu2-pp.out &&
average.x -i Cr2Cu2-wf.ave.in > Cr2Cu2-wf.ave.out &&
mv avg.dat Cr2Cu2-avg.dat &&
projwfc.x -i Cr2Cu2-pdos.in > Cr2Cu2-pdos.out &&
sleep 10

pp.x      -i Cr2Ru2-pp.in > Cr2Ru2-pp.out &&
average.x -i Cr2Ru2-wf.ave.in > Cr2Ru2-wf.ave.out &&
mv avg.dat Cr2Ru2-avg.dat &&
projwfc.x -i Cr2Ru2-pdos.in > Cr2Ru2-pdos.out &&
sleep 10

pp.x      -i Cu2Ag2-pp.in > Cu2Ag2-pp.out &&
average.x -i Cu2Ag2-wf.ave.in > Cu2Ag2-wf.ave.out &&
mv avg.dat Cu2Ag2-avg.dat &&
projwfc.x -i Cu2Ag2-pdos.in > Cu2Ag2-pdos.out &&
sleep 10

pp.x      -i Cu2Au2-pp.in > Cu2Au2-pp.out &&
average.x -i Cu2Au2-wf.ave.in > Cu2Au2-wf.ave.out &&
mv avg.dat Cu2Au2-avg.dat &&
projwfc.x -i Cu2Au2-pdos.in > Cu2Au2-pdos.out &&
sleep 10

pp.x      -i Cu2Cd2-pp.in > Cu2Cd2-pp.out &&
average.x -i Cu2Cd2-wf.ave.in > Cu2Cd2-wf.ave.out &&
mv avg.dat Cu2Cd2-avg.dat &&
projwfc.x -i Cu2Cd2-pdos.in > Cu2Cd2-pdos.out &&
sleep 10

pp.x      -i Cu2Hg2-pp.in > Cu2Hg2-pp.out &&
average.x -i Cu2Hg2-wf.ave.in > Cu2Hg2-wf.ave.out &&
mv avg.dat Cu2Hg2-avg.dat &&
projwfc.x -i Cu2Hg2-pdos.in > Cu2Hg2-pdos.out &&
sleep 10

pp.x      -i Cu2Mo2-pp.in > Cu2Mo2-pp.out &&
average.x -i Cu2Mo2-wf.ave.in > Cu2Mo2-wf.ave.out &&
mv avg.dat Cu2Mo2-avg.dat &&
projwfc.x -i Cu2Mo2-pdos.in > Cu2Mo2-pdos.out &&
sleep 10

pp.x      -i Cu2Zr2-pp.in > Cu2Zr2-pp.out &&
average.x -i Cu2Zr2-wf.ave.in > Cu2Zr2-wf.ave.out &&
mv avg.dat Cu2Zr2-avg.dat &&
projwfc.x -i Cu2Zr2-pdos.in > Cu2Zr2-pdos.out &&
sleep 10

pp.x      -i Mo2Ag2-pp.in > Mo2Ag2-pp.out &&
average.x -i Mo2Ag2-wf.ave.in > Mo2Ag2-wf.ave.out &&
mv avg.dat Mo2Ag2-avg.dat &&
projwfc.x -i Mo2Ag2-pdos.in > Mo2Ag2-pdos.out &&
sleep 10

pp.x      -i Mo2Ru2-pp.in > Mo2Ru2-pp.out &&
average.x -i Mo2Ru2-wf.ave.in > Mo2Ru2-wf.ave.out &&
mv avg.dat Mo2Ru2-avg.dat &&
projwfc.x -i Mo2Ru2-pdos.in > Mo2Ru2-pdos.out &&
sleep 10

pp.x      -i Nb2Ag2-pp.in > Nb2Ag2-pp.out &&
average.x -i Nb2Ag2-wf.ave.in > Nb2Ag2-wf.ave.out &&
mv avg.dat Nb2Ag2-avg.dat &&
projwfc.x -i Nb2Ag2-pdos.in > Nb2Ag2-pdos.out &&
sleep 10

pp.x      -i Nb2Ru2-pp.in > Nb2Ru2-pp.out &&
average.x -i Nb2Ru2-wf.ave.in > Nb2Ru2-wf.ave.out &&
mv avg.dat Nb2Ru2-avg.dat &&
projwfc.x -i Nb2Ru2-pdos.in > Nb2Ru2-pdos.out &&
sleep 10

pp.x      -i Rh2Ag2-pp.in > Rh2Ag2-pp.out &&
average.x -i Rh2Ag2-wf.ave.in > Rh2Ag2-wf.ave.out &&
mv avg.dat Rh2Ag2-avg.dat &&
projwfc.x -i Rh2Ag2-pdos.in > Rh2Ag2-pdos.out &&
sleep 10

pp.x      -i Ru2Ag2-pp.in > Ru2Ag2-pp.out &&
average.x -i Ru2Ag2-wf.ave.in > Ru2Ag2-wf.ave.out &&
mv avg.dat Ru2Ag2-avg.dat &&
projwfc.x -i Ru2Ag2-pdos.in > Ru2Ag2-pdos.out &&
sleep 10

pp.x      -i Ru2Au2-pp.in > Ru2Au2-pp.out &&
average.x -i Ru2Au2-wf.ave.in > Ru2Au2-wf.ave.out &&
mv avg.dat Ru2Au2-avg.dat &&
projwfc.x -i Ru2Au2-pdos.in > Ru2Au2-pdos.out &&
sleep 10

pp.x      -i Ru2Cd2-pp.in > Ru2Cd2-pp.out &&
average.x -i Ru2Cd2-wf.ave.in > Ru2Cd2-wf.ave.out &&
mv avg.dat Ru2Cd2-avg.dat &&
projwfc.x -i Ru2Cd2-pdos.in > Ru2Cd2-pdos.out &&
sleep 10

pp.x      -i Ru2Hg2-pp.in > Ru2Hg2-pp.out &&
average.x -i Ru2Hg2-wf.ave.in > Ru2Hg2-wf.ave.out &&
mv avg.dat Ru2Hg2-avg.dat &&
projwfc.x -i Ru2Hg2-pdos.in > Ru2Hg2-pdos.out &&
sleep 10
