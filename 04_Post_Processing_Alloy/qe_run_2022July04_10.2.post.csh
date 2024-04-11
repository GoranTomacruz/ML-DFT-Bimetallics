./2022July04_10/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-10.2-##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.10.out     ##CHANGE
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
pp.x      -i Co2Ag2-pp.in &&
dos.x     -i Co2Ag2-dos.in &&
average.x -i Co2Ag2-wf.ave.in > Co2Ag2-wf.ave.out &&
mv avg.dat Co2Ag2-avg.dat &&
sleep 10

projwfc.x -i Co2Ag2-pdos.in &&
sleep 5

pp.x      -i Co2Au2-pp.in &&
dos.x     -i Co2Au2-dos.in &&
average.x -i Co2Au2-wf.ave.in > Co2Au2-wf.ave.out &&
mv avg.dat Co2Au2-avg.dat &&
sleep 10

projwfc.x -i Co2Au2-pdos.in &&
sleep 5

pp.x      -i Co2Cd2-pp.in &&
dos.x     -i Co2Cd2-dos.in &&
average.x -i Co2Cd2-wf.ave.in > Co2Cd2-wf.ave.out &&
mv avg.dat Co2Cd2-avg.dat &&
sleep 10

projwfc.x -i Co2Cd2-pdos.in &&
sleep 5

pp.x      -i Co2Cu2-pp.in &&
dos.x     -i Co2Cu2-dos.in &&
average.x -i Co2Cu2-wf.ave.in > Co2Cu2-wf.ave.out &&
mv avg.dat Co2Cu2-avg.dat &&
sleep 10

projwfc.x -i Co2Cu2-pdos.in &&
sleep 5

pp.x      -i Co2Hf2-pp.in &&
dos.x     -i Co2Hf2-dos.in &&
average.x -i Co2Hf2-wf.ave.in > Co2Hf2-wf.ave.out &&
mv avg.dat Co2Hf2-avg.dat &&
sleep 10

projwfc.x -i Co2Hf2-pdos.in &&
sleep 5

pp.x      -i Co2Hg2-pp.in &&
dos.x     -i Co2Hg2-dos.in &&
average.x -i Co2Hg2-wf.ave.in > Co2Hg2-wf.ave.out &&
mv avg.dat Co2Hg2-avg.dat &&
sleep 10

projwfc.x -i Co2Hg2-pdos.in &&
sleep 5

pp.x      -i Co2Ir2-pp.in &&
dos.x     -i Co2Ir2-dos.in &&
average.x -i Co2Ir2-wf.ave.in > Co2Ir2-wf.ave.out &&
mv avg.dat Co2Ir2-avg.dat &&
sleep 10

projwfc.x -i Co2Ir2-pdos.in &&
sleep 5

pp.x      -i Co2La2-pp.in &&
dos.x     -i Co2La2-dos.in &&
average.x -i Co2La2-wf.ave.in > Co2La2-wf.ave.out &&
mv avg.dat Co2La2-avg.dat &&
sleep 10

projwfc.x -i Co2La2-pdos.in &&
sleep 5

pp.x      -i Co2Ni2-pp.in &&
dos.x     -i Co2Ni2-dos.in &&
average.x -i Co2Ni2-wf.ave.in > Co2Ni2-wf.ave.out &&
mv avg.dat Co2Ni2-avg.dat &&
sleep 10

projwfc.x -i Co2Ni2-pdos.in &&
sleep 5

pp.x      -i Co2Os2-pp.in &&
dos.x     -i Co2Os2-dos.in &&
average.x -i Co2Os2-wf.ave.in > Co2Os2-wf.ave.out &&
mv avg.dat Co2Os2-avg.dat &&
sleep 10

projwfc.x -i Co2Os2-pdos.in &&
sleep 5

pp.x      -i Co2Pd2-pp.in &&
dos.x     -i Co2Pd2-dos.in &&
average.x -i Co2Pd2-wf.ave.in > Co2Pd2-wf.ave.out &&
mv avg.dat Co2Pd2-avg.dat &&
sleep 10

projwfc.x -i Co2Pd2-pdos.in &&
sleep 5

pp.x      -i Co2Pt2-pp.in &&
dos.x     -i Co2Pt2-dos.in &&
average.x -i Co2Pt2-wf.ave.in > Co2Pt2-wf.ave.out &&
mv avg.dat Co2Pt2-avg.dat &&
sleep 10

projwfc.x -i Co2Pt2-pdos.in &&
sleep 5

pp.x      -i Co2Re2-pp.in &&
dos.x     -i Co2Re2-dos.in &&
average.x -i Co2Re2-wf.ave.in > Co2Re2-wf.ave.out &&
mv avg.dat Co2Re2-avg.dat &&
sleep 10

projwfc.x -i Co2Re2-pdos.in &&
sleep 5

pp.x      -i Co2Rh2-pp.in &&
dos.x     -i Co2Rh2-dos.in &&
average.x -i Co2Rh2-wf.ave.in > Co2Rh2-wf.ave.out &&
mv avg.dat Co2Rh2-avg.dat &&
sleep 10

projwfc.x -i Co2Rh2-pdos.in &&
sleep 5

pp.x      -i Co2Ru2-pp.in &&
dos.x     -i Co2Ru2-dos.in &&
average.x -i Co2Ru2-wf.ave.in > Co2Ru2-wf.ave.out &&
mv avg.dat Co2Ru2-avg.dat &&
sleep 10

projwfc.x -i Co2Ru2-pdos.in &&
sleep 5

pp.x      -i Co2Sc2-pp.in &&
dos.x     -i Co2Sc2-dos.in &&
average.x -i Co2Sc2-wf.ave.in > Co2Sc2-wf.ave.out &&
mv avg.dat Co2Sc2-avg.dat &&
sleep 10

projwfc.x -i Co2Sc2-pdos.in &&
sleep 5

pp.x      -i Co2Ti2-pp.in &&
dos.x     -i Co2Ti2-dos.in &&
average.x -i Co2Ti2-wf.ave.in > Co2Ti2-wf.ave.out &&
mv avg.dat Co2Ti2-avg.dat &&
sleep 10

projwfc.x -i Co2Ti2-pdos.in &&
sleep 5

pp.x      -i Co2V2-pp.in &&
dos.x     -i Co2V2-dos.in &&
average.x -i Co2V2-wf.ave.in > Co2V2-wf.ave.out &&
mv avg.dat Co2V2-avg.dat &&
sleep 10

projwfc.x -i Co2V2-pdos.in &&
sleep 5

pp.x      -i Co2W2-pp.in &&
dos.x     -i Co2W2-dos.in &&
average.x -i Co2W2-wf.ave.in > Co2W2-wf.ave.out &&
mv avg.dat Co2W2-avg.dat &&
sleep 10

projwfc.x -i Co2W2-pdos.in &&
sleep 5

pp.x      -i Co2Y2-pp.in &&
dos.x     -i Co2Y2-dos.in &&
average.x -i Co2Y2-wf.ave.in > Co2Y2-wf.ave.out &&
mv avg.dat Co2Y2-avg.dat &&
sleep 10

projwfc.x -i Co2Y2-pdos.in &&
sleep 5

pp.x      -i Co2Zn2-pp.in &&
dos.x     -i Co2Zn2-dos.in &&
average.x -i Co2Zn2-wf.ave.in > Co2Zn2-wf.ave.out &&
mv avg.dat Co2Zn2-avg.dat &&
sleep 10

projwfc.x -i Co2Zn2-pdos.in &&
sleep 5

pp.x      -i Co2Zr2-pp.in &&
dos.x     -i Co2Zr2-dos.in &&
average.x -i Co2Zr2-wf.ave.in > Co2Zr2-wf.ave.out &&
mv avg.dat Co2Zr2-avg.dat &&
sleep 10

projwfc.x -i Co2Zr2-pdos.in &&
sleep 5

