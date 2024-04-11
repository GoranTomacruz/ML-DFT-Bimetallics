./2022July04_09/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-09.2-##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.09.out     ##CHANGE
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
pp.x      -i Cr2Ni2-pp.in &&
dos.x     -i Cr2Ni2-dos.in &&
average.x -i Cr2Ni2-wf.ave.in > Cr2Ni2-wf.ave.out &&
mv avg.dat Cr2Ni2-avg.dat &&
sleep 10

projwfc.x -i Cr2Ni2-pdos.in &&
sleep 5

pp.x      -i Ni2Ag2-pp.in &&
dos.x     -i Ni2Ag2-dos.in &&
average.x -i Ni2Ag2-wf.ave.in > Ni2Ag2-wf.ave.out &&
mv avg.dat Ni2Ag2-avg.dat &&
sleep 10

projwfc.x -i Ni2Ag2-pdos.in &&
sleep 5

pp.x      -i Ni2Au2-pp.in &&
dos.x     -i Ni2Au2-dos.in &&
average.x -i Ni2Au2-wf.ave.in > Ni2Au2-wf.ave.out &&
mv avg.dat Ni2Au2-avg.dat &&
sleep 10

projwfc.x -i Ni2Au2-pdos.in &&
sleep 5

pp.x      -i Ni2Cd2-pp.in &&
dos.x     -i Ni2Cd2-dos.in &&
average.x -i Ni2Cd2-wf.ave.in > Ni2Cd2-wf.ave.out &&
mv avg.dat Ni2Cd2-avg.dat &&
sleep 10

projwfc.x -i Ni2Cd2-pdos.in &&
sleep 5

pp.x      -i Ni2Cu2-pp.in &&
dos.x     -i Ni2Cu2-dos.in &&
average.x -i Ni2Cu2-wf.ave.in > Ni2Cu2-wf.ave.out &&
mv avg.dat Ni2Cu2-avg.dat &&
sleep 10

projwfc.x -i Ni2Cu2-pdos.in &&
sleep 5

pp.x      -i Ni2Hf2-pp.in &&
dos.x     -i Ni2Hf2-dos.in &&
average.x -i Ni2Hf2-wf.ave.in > Ni2Hf2-wf.ave.out &&
mv avg.dat Ni2Hf2-avg.dat &&
sleep 10

projwfc.x -i Ni2Hf2-pdos.in &&
sleep 5

pp.x      -i Ni2Hg2-pp.in &&
dos.x     -i Ni2Hg2-dos.in &&
average.x -i Ni2Hg2-wf.ave.in > Ni2Hg2-wf.ave.out &&
mv avg.dat Ni2Hg2-avg.dat &&
sleep 10

projwfc.x -i Ni2Hg2-pdos.in &&
sleep 5

pp.x      -i Ni2Ir2-pp.in &&
dos.x     -i Ni2Ir2-dos.in &&
average.x -i Ni2Ir2-wf.ave.in > Ni2Ir2-wf.ave.out &&
mv avg.dat Ni2Ir2-avg.dat &&
sleep 10

projwfc.x -i Ni2Ir2-pdos.in &&
sleep 5

pp.x      -i Ni2La2-pp.in &&
dos.x     -i Ni2La2-dos.in &&
average.x -i Ni2La2-wf.ave.in > Ni2La2-wf.ave.out &&
mv avg.dat Ni2La2-avg.dat &&
sleep 10

projwfc.x -i Ni2La2-pdos.in &&
sleep 5

pp.x      -i Ni2Mo2-pp.in &&
dos.x     -i Ni2Mo2-dos.in &&
average.x -i Ni2Mo2-wf.ave.in > Ni2Mo2-wf.ave.out &&
mv avg.dat Ni2Mo2-avg.dat &&
sleep 10

projwfc.x -i Ni2Mo2-pdos.in &&
sleep 5

pp.x      -i Ni2Nb2-pp.in &&
dos.x     -i Ni2Nb2-dos.in &&
average.x -i Ni2Nb2-wf.ave.in > Ni2Nb2-wf.ave.out &&
mv avg.dat Ni2Nb2-avg.dat &&
sleep 10

projwfc.x -i Ni2Nb2-pdos.in &&
sleep 5

pp.x      -i Ni2Os2-pp.in &&
dos.x     -i Ni2Os2-dos.in &&
average.x -i Ni2Os2-wf.ave.in > Ni2Os2-wf.ave.out &&
mv avg.dat Ni2Os2-avg.dat &&
sleep 10

projwfc.x -i Ni2Os2-pdos.in &&
sleep 5

pp.x      -i Ni2Pd2-pp.in &&
dos.x     -i Ni2Pd2-dos.in &&
average.x -i Ni2Pd2-wf.ave.in > Ni2Pd2-wf.ave.out &&
mv avg.dat Ni2Pd2-avg.dat &&
sleep 10

projwfc.x -i Ni2Pd2-pdos.in &&
sleep 5

pp.x      -i Ni2Pt2-pp.in &&
dos.x     -i Ni2Pt2-dos.in &&
average.x -i Ni2Pt2-wf.ave.in > Ni2Pt2-wf.ave.out &&
mv avg.dat Ni2Pt2-avg.dat &&
sleep 10

projwfc.x -i Ni2Pt2-pdos.in &&
sleep 5

pp.x      -i Ni2Re2-pp.in &&
dos.x     -i Ni2Re2-dos.in &&
average.x -i Ni2Re2-wf.ave.in > Ni2Re2-wf.ave.out &&
mv avg.dat Ni2Re2-avg.dat &&
sleep 10

projwfc.x -i Ni2Re2-pdos.in &&
sleep 5

pp.x      -i Ni2Rh2-pp.in &&
dos.x     -i Ni2Rh2-dos.in &&
average.x -i Ni2Rh2-wf.ave.in > Ni2Rh2-wf.ave.out &&
mv avg.dat Ni2Rh2-avg.dat &&
sleep 10

projwfc.x -i Ni2Rh2-pdos.in &&
sleep 5

pp.x      -i Ni2Ru2-pp.in &&
dos.x     -i Ni2Ru2-dos.in &&
average.x -i Ni2Ru2-wf.ave.in > Ni2Ru2-wf.ave.out &&
mv avg.dat Ni2Ru2-avg.dat &&
sleep 10

projwfc.x -i Ni2Ru2-pdos.in &&
sleep 5

pp.x      -i Ni2Ta2-pp.in &&
dos.x     -i Ni2Ta2-dos.in &&
average.x -i Ni2Ta2-wf.ave.in > Ni2Ta2-wf.ave.out &&
mv avg.dat Ni2Ta2-avg.dat &&
sleep 10

projwfc.x -i Ni2Ta2-pdos.in &&
sleep 5

pp.x      -i Ni2W2-pp.in &&
dos.x     -i Ni2W2-dos.in &&
average.x -i Ni2W2-wf.ave.in > Ni2W2-wf.ave.out &&
mv avg.dat Ni2W2-avg.dat &&
sleep 10

projwfc.x -i Ni2W2-pdos.in &&
sleep 5

pp.x      -i Ni2Y2-pp.in &&
dos.x     -i Ni2Y2-dos.in &&
average.x -i Ni2Y2-wf.ave.in > Ni2Y2-wf.ave.out &&
mv avg.dat Ni2Y2-avg.dat &&
sleep 10

projwfc.x -i Ni2Y2-pdos.in &&
sleep 5

pp.x      -i Ni2Zn2-pp.in &&
dos.x     -i Ni2Zn2-dos.in &&
average.x -i Ni2Zn2-wf.ave.in > Ni2Zn2-wf.ave.out &&
mv avg.dat Ni2Zn2-avg.dat &&
sleep 10

projwfc.x -i Ni2Zn2-pdos.in &&
sleep 5

pp.x      -i Ni2Zr2-pp.in &&
dos.x     -i Ni2Zr2-dos.in &&
average.x -i Ni2Zr2-wf.ave.in > Ni2Zr2-wf.ave.out &&
mv avg.dat Ni2Zr2-avg.dat &&
sleep 10

projwfc.x -i Ni2Zr2-pdos.in &&
sleep 5

