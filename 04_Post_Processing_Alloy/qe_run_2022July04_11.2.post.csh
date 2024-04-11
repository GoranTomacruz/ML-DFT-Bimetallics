./2022July04_11/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-11.2-##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.11.out     ##CHANGE
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
pp.x      -i Co2Mn2-pp.in &&
dos.x     -i Co2Mn2-dos.in &&
average.x -i Co2Mn2-wf.ave.in > Co2Mn2-wf.ave.out &&
mv avg.dat Co2Mn2-avg.dat &&
sleep 10

projwfc.x -i Co2Mn2-pdos.in &&
sleep 5

pp.x      -i Cr2Mn2-pp.in &&
dos.x     -i Cr2Mn2-dos.in &&
average.x -i Cr2Mn2-wf.ave.in > Cr2Mn2-wf.ave.out &&
mv avg.dat Cr2Mn2-avg.dat &&
sleep 10

projwfc.x -i Cr2Mn2-pdos.in &&
sleep 5

pp.x      -i Mn2Ag2-pp.in &&
dos.x     -i Mn2Ag2-dos.in &&
average.x -i Mn2Ag2-wf.ave.in > Mn2Ag2-wf.ave.out &&
mv avg.dat Mn2Ag2-avg.dat &&
sleep 10

projwfc.x -i Mn2Ag2-pdos.in &&
sleep 5

pp.x      -i Mn2Au2-pp.in &&
dos.x     -i Mn2Au2-dos.in &&
average.x -i Mn2Au2-wf.ave.in > Mn2Au2-wf.ave.out &&
mv avg.dat Mn2Au2-avg.dat &&
sleep 10

projwfc.x -i Mn2Au2-pdos.in &&
sleep 5

pp.x      -i Mn2Cd2-pp.in &&
dos.x     -i Mn2Cd2-dos.in &&
average.x -i Mn2Cd2-wf.ave.in > Mn2Cd2-wf.ave.out &&
mv avg.dat Mn2Cd2-avg.dat &&
sleep 10

projwfc.x -i Mn2Cd2-pdos.in &&
sleep 5

pp.x      -i Mn2Cu2-pp.in &&
dos.x     -i Mn2Cu2-dos.in &&
average.x -i Mn2Cu2-wf.ave.in > Mn2Cu2-wf.ave.out &&
mv avg.dat Mn2Cu2-avg.dat &&
sleep 10

projwfc.x -i Mn2Cu2-pdos.in &&
sleep 5

pp.x      -i Mn2Hg2-pp.in &&
dos.x     -i Mn2Hg2-dos.in &&
average.x -i Mn2Hg2-wf.ave.in > Mn2Hg2-wf.ave.out &&
mv avg.dat Mn2Hg2-avg.dat &&
sleep 10

projwfc.x -i Mn2Hg2-pdos.in &&
sleep 5

pp.x      -i Mn2Ir2-pp.in &&
dos.x     -i Mn2Ir2-dos.in &&
average.x -i Mn2Ir2-wf.ave.in > Mn2Ir2-wf.ave.out &&
mv avg.dat Mn2Ir2-avg.dat &&
sleep 10

projwfc.x -i Mn2Ir2-pdos.in &&
sleep 5

pp.x      -i Mn2La2-pp.in &&
dos.x     -i Mn2La2-dos.in &&
average.x -i Mn2La2-wf.ave.in > Mn2La2-wf.ave.out &&
mv avg.dat Mn2La2-avg.dat &&
sleep 10

projwfc.x -i Mn2La2-pdos.in &&
sleep 5

pp.x      -i Mn2Mo2-pp.in &&
dos.x     -i Mn2Mo2-dos.in &&
average.x -i Mn2Mo2-wf.ave.in > Mn2Mo2-wf.ave.out &&
mv avg.dat Mn2Mo2-avg.dat &&
sleep 10

projwfc.x -i Mn2Mo2-pdos.in &&
sleep 5

pp.x      -i Mn2Nb2-pp.in &&
dos.x     -i Mn2Nb2-dos.in &&
average.x -i Mn2Nb2-wf.ave.in > Mn2Nb2-wf.ave.out &&
mv avg.dat Mn2Nb2-avg.dat &&
sleep 10

projwfc.x -i Mn2Nb2-pdos.in &&
sleep 5

pp.x      -i Mn2Ni2-pp.in &&
dos.x     -i Mn2Ni2-dos.in &&
average.x -i Mn2Ni2-wf.ave.in > Mn2Ni2-wf.ave.out &&
mv avg.dat Mn2Ni2-avg.dat &&
sleep 10

projwfc.x -i Mn2Ni2-pdos.in &&
sleep 5

pp.x      -i Mn2Pd2-pp.in &&
dos.x     -i Mn2Pd2-dos.in &&
average.x -i Mn2Pd2-wf.ave.in > Mn2Pd2-wf.ave.out &&
mv avg.dat Mn2Pd2-avg.dat &&
sleep 10

projwfc.x -i Mn2Pd2-pdos.in &&
sleep 5

pp.x      -i Mn2Pt2-pp.in &&
dos.x     -i Mn2Pt2-dos.in &&
average.x -i Mn2Pt2-wf.ave.in > Mn2Pt2-wf.ave.out &&
mv avg.dat Mn2Pt2-avg.dat &&
sleep 10

projwfc.x -i Mn2Pt2-pdos.in &&
sleep 5

pp.x      -i Mn2Re2-pp.in &&
dos.x     -i Mn2Re2-dos.in &&
average.x -i Mn2Re2-wf.ave.in > Mn2Re2-wf.ave.out &&
mv avg.dat Mn2Re2-avg.dat &&
sleep 10

projwfc.x -i Mn2Re2-pdos.in &&
sleep 5

pp.x      -i Mn2Rh2-pp.in &&
dos.x     -i Mn2Rh2-dos.in &&
average.x -i Mn2Rh2-wf.ave.in > Mn2Rh2-wf.ave.out &&
mv avg.dat Mn2Rh2-avg.dat &&
sleep 10

projwfc.x -i Mn2Rh2-pdos.in &&
sleep 5

pp.x      -i Mn2Ru2-pp.in &&
dos.x     -i Mn2Ru2-dos.in &&
average.x -i Mn2Ru2-wf.ave.in > Mn2Ru2-wf.ave.out &&
mv avg.dat Mn2Ru2-avg.dat &&
sleep 10

projwfc.x -i Mn2Ru2-pdos.in &&
sleep 5

pp.x      -i Mn2Ta2-pp.in &&
dos.x     -i Mn2Ta2-dos.in &&
average.x -i Mn2Ta2-wf.ave.in > Mn2Ta2-wf.ave.out &&
mv avg.dat Mn2Ta2-avg.dat &&
sleep 10

projwfc.x -i Mn2Ta2-pdos.in &&
sleep 5

pp.x      -i Mn2W2-pp.in &&
dos.x     -i Mn2W2-dos.in &&
average.x -i Mn2W2-wf.ave.in > Mn2W2-wf.ave.out &&
mv avg.dat Mn2W2-avg.dat &&
sleep 10

projwfc.x -i Mn2W2-pdos.in &&
sleep 5

pp.x      -i Mn2Y2-pp.in &&
dos.x     -i Mn2Y2-dos.in &&
average.x -i Mn2Y2-wf.ave.in > Mn2Y2-wf.ave.out &&
mv avg.dat Mn2Y2-avg.dat &&
sleep 10

projwfc.x -i Mn2Y2-pdos.in &&
sleep 5

pp.x      -i Mn2Zn2-pp.in &&
dos.x     -i Mn2Zn2-dos.in &&
average.x -i Mn2Zn2-wf.ave.in > Mn2Zn2-wf.ave.out &&
mv avg.dat Mn2Zn2-avg.dat &&
sleep 10

projwfc.x -i Mn2Zn2-pdos.in &&
sleep 5

pp.x      -i Mn2Zr2-pp.in &&
dos.x     -i Mn2Zr2-dos.in &&
average.x -i Mn2Zr2-wf.ave.in > Mn2Zr2-wf.ave.out &&
mv avg.dat Mn2Zr2-avg.dat &&
sleep 10

projwfc.x -i Mn2Zr2-pdos.in &&
sleep 5

