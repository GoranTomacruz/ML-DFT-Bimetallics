#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP2-5.1##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July11files.05.out     ##CHANGE
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
pp.x      -i Au2Hg2-pp.in > Au2Hg2-pp.out &&
average.x -i Au2Hg2-wf.ave.in > Au2Hg2-wf.ave.out &&
mv avg.dat Au2Hg2-avg.dat &&
projwfc.x -i Au2Hg2-pdos.in > Au2Hg2-pdos.out &&
sleep 10

pp.x      -i Cd2Hg2-pp.in > Cd2Hg2-pp.out &&
average.x -i Cd2Hg2-wf.ave.in > Cd2Hg2-wf.ave.out &&
mv avg.dat Cd2Hg2-avg.dat &&
projwfc.x -i Cd2Hg2-pdos.in > Cd2Hg2-pdos.out &&
sleep 10

pp.x      -i Cd2Os2-pp.in > Cd2Os2-pp.out &&
average.x -i Cd2Os2-wf.ave.in > Cd2Os2-wf.ave.out &&
mv avg.dat Cd2Os2-avg.dat &&
projwfc.x -i Cd2Os2-pdos.in > Cd2Os2-pdos.out &&
sleep 10

pp.x      -i Cd2Y2-pp.in > Cd2Y2-pp.out &&
average.x -i Cd2Y2-wf.ave.in > Cd2Y2-wf.ave.out &&
mv avg.dat Cd2Y2-avg.dat &&
projwfc.x -i Cd2Y2-pdos.in > Cd2Y2-pdos.out &&
sleep 10

pp.x      -i Cr2Hg2-pp.in > Cr2Hg2-pp.out &&
average.x -i Cr2Hg2-wf.ave.in > Cr2Hg2-wf.ave.out &&
mv avg.dat Cr2Hg2-avg.dat &&
projwfc.x -i Cr2Hg2-pdos.in > Cr2Hg2-pdos.out &&
sleep 10

pp.x      -i Cr2Nb2-pp.in > Cr2Nb2-pp.out &&
average.x -i Cr2Nb2-wf.ave.in > Cr2Nb2-wf.ave.out &&
mv avg.dat Cr2Nb2-avg.dat &&
projwfc.x -i Cr2Nb2-pdos.in > Cr2Nb2-pdos.out &&
sleep 10

pp.x      -i Cr2Os2-pp.in > Cr2Os2-pp.out &&
average.x -i Cr2Os2-wf.ave.in > Cr2Os2-wf.ave.out &&
mv avg.dat Cr2Os2-avg.dat &&
projwfc.x -i Cr2Os2-pdos.in > Cr2Os2-pdos.out &&
sleep 10

pp.x      -i Cr2Y2-pp.in > Cr2Y2-pp.out &&
average.x -i Cr2Y2-wf.ave.in > Cr2Y2-wf.ave.out &&
mv avg.dat Cr2Y2-avg.dat &&
projwfc.x -i Cr2Y2-pdos.in > Cr2Y2-pdos.out &&
sleep 10

pp.x      -i Mo2Hg2-pp.in > Mo2Hg2-pp.out &&
average.x -i Mo2Hg2-wf.ave.in > Mo2Hg2-wf.ave.out &&
mv avg.dat Mo2Hg2-avg.dat &&
projwfc.x -i Mo2Hg2-pdos.in > Mo2Hg2-pdos.out &&
sleep 10

pp.x      -i Mo2Os2-pp.in > Mo2Os2-pp.out &&
average.x -i Mo2Os2-wf.ave.in > Mo2Os2-wf.ave.out &&
mv avg.dat Mo2Os2-avg.dat &&
projwfc.x -i Mo2Os2-pdos.in > Mo2Os2-pdos.out &&
sleep 10

pp.x      -i Mo2Y2-pp.in > Mo2Y2-pp.out &&
average.x -i Mo2Y2-wf.ave.in > Mo2Y2-wf.ave.out &&
mv avg.dat Mo2Y2-avg.dat &&
projwfc.x -i Mo2Y2-pdos.in > Mo2Y2-pdos.out &&
sleep 10

pp.x      -i Nb2Au2-pp.in > Nb2Au2-pp.out &&
average.x -i Nb2Au2-wf.ave.in > Nb2Au2-wf.ave.out &&
mv avg.dat Nb2Au2-avg.dat &&
projwfc.x -i Nb2Au2-pdos.in > Nb2Au2-pdos.out &&
sleep 10

pp.x      -i Nb2Cd2-pp.in > Nb2Cd2-pp.out &&
average.x -i Nb2Cd2-wf.ave.in > Nb2Cd2-wf.ave.out &&
mv avg.dat Nb2Cd2-avg.dat &&
projwfc.x -i Nb2Cd2-pdos.in > Nb2Cd2-pdos.out &&
sleep 10

pp.x      -i Nb2Hg2-pp.in > Nb2Hg2-pp.out &&
average.x -i Nb2Hg2-wf.ave.in > Nb2Hg2-wf.ave.out &&
mv avg.dat Nb2Hg2-avg.dat &&
projwfc.x -i Nb2Hg2-pdos.in > Nb2Hg2-pdos.out &&
sleep 10

pp.x      -i Nb2Mo2-pp.in > Nb2Mo2-pp.out &&
average.x -i Nb2Mo2-wf.ave.in > Nb2Mo2-wf.ave.out &&
mv avg.dat Nb2Mo2-avg.dat &&
projwfc.x -i Nb2Mo2-pdos.in > Nb2Mo2-pdos.out &&
sleep 10
