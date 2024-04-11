./2022July04_08/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-08.2-##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.08.out     ##CHANGE
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
pp.x      -i Cr2La2-pp.in &&
dos.x     -i Cr2La2-dos.in &&
average.x -i Cr2La2-wf.ave.in > Cr2La2-wf.ave.out &&
mv avg.dat Cr2La2-avg.dat &&
sleep 10

projwfc.x -i Cr2La2-pdos.in &&
sleep 5

pp.x      -i Cu2La2-pp.in &&
dos.x     -i Cu2La2-dos.in &&
average.x -i Cu2La2-wf.ave.in > Cu2La2-wf.ave.out &&
mv avg.dat Cu2La2-avg.dat &&
sleep 10

projwfc.x -i Cu2La2-pdos.in &&
sleep 5

pp.x      -i La2Ag2-pp.in &&
dos.x     -i La2Ag2-dos.in &&
average.x -i La2Ag2-wf.ave.in > La2Ag2-wf.ave.out &&
mv avg.dat La2Ag2-avg.dat &&
sleep 10

projwfc.x -i La2Ag2-pdos.in &&
sleep 5

pp.x      -i La2Au2-pp.in &&
dos.x     -i La2Au2-dos.in &&
average.x -i La2Au2-wf.ave.in > La2Au2-wf.ave.out &&
mv avg.dat La2Au2-avg.dat &&
sleep 10

projwfc.x -i La2Au2-pdos.in &&
sleep 5

pp.x      -i La2Cd2-pp.in &&
dos.x     -i La2Cd2-dos.in &&
average.x -i La2Cd2-wf.ave.in > La2Cd2-wf.ave.out &&
mv avg.dat La2Cd2-avg.dat &&
sleep 10

projwfc.x -i La2Cd2-pdos.in &&
sleep 5

pp.x      -i La2Hf2-pp.in &&
dos.x     -i La2Hf2-dos.in &&
average.x -i La2Hf2-wf.ave.in > La2Hf2-wf.ave.out &&
mv avg.dat La2Hf2-avg.dat &&
sleep 10

projwfc.x -i La2Hf2-pdos.in &&
sleep 5

pp.x      -i La2Hg2-pp.in &&
dos.x     -i La2Hg2-dos.in &&
average.x -i La2Hg2-wf.ave.in > La2Hg2-wf.ave.out &&
mv avg.dat La2Hg2-avg.dat &&
sleep 10

projwfc.x -i La2Hg2-pdos.in &&
sleep 5

pp.x      -i La2Ir2-pp.in &&
dos.x     -i La2Ir2-dos.in &&
average.x -i La2Ir2-wf.ave.in > La2Ir2-wf.ave.out &&
mv avg.dat La2Ir2-avg.dat &&
sleep 10

projwfc.x -i La2Ir2-pdos.in &&
sleep 5

pp.x      -i La2Mo2-pp.in &&
dos.x     -i La2Mo2-dos.in &&
average.x -i La2Mo2-wf.ave.in > La2Mo2-wf.ave.out &&
mv avg.dat La2Mo2-avg.dat &&
sleep 10

projwfc.x -i La2Mo2-pdos.in &&
sleep 5

pp.x      -i La2Nb2-pp.in &&
dos.x     -i La2Nb2-dos.in &&
average.x -i La2Nb2-wf.ave.in > La2Nb2-wf.ave.out &&
mv avg.dat La2Nb2-avg.dat &&
sleep 10

projwfc.x -i La2Nb2-pdos.in &&
sleep 5

pp.x      -i La2Os2-pp.in &&
dos.x     -i La2Os2-dos.in &&
average.x -i La2Os2-wf.ave.in > La2Os2-wf.ave.out &&
mv avg.dat La2Os2-avg.dat &&
sleep 10

projwfc.x -i La2Os2-pdos.in &&
sleep 5

pp.x      -i La2Pd2-pp.in &&
dos.x     -i La2Pd2-dos.in &&
average.x -i La2Pd2-wf.ave.in > La2Pd2-wf.ave.out &&
mv avg.dat La2Pd2-avg.dat &&
sleep 10

projwfc.x -i La2Pd2-pdos.in &&
sleep 5

pp.x      -i La2Pt2-pp.in &&
dos.x     -i La2Pt2-dos.in &&
average.x -i La2Pt2-wf.ave.in > La2Pt2-wf.ave.out &&
mv avg.dat La2Pt2-avg.dat &&
sleep 10

projwfc.x -i La2Pt2-pdos.in &&
sleep 5

pp.x      -i La2Re2-pp.in &&
dos.x     -i La2Re2-dos.in &&
average.x -i La2Re2-wf.ave.in > La2Re2-wf.ave.out &&
mv avg.dat La2Re2-avg.dat &&
sleep 10

projwfc.x -i La2Re2-pdos.in &&
sleep 5

pp.x      -i La2Rh2-pp.in &&
dos.x     -i La2Rh2-dos.in &&
average.x -i La2Rh2-wf.ave.in > La2Rh2-wf.ave.out &&
mv avg.dat La2Rh2-avg.dat &&
sleep 10

projwfc.x -i La2Rh2-pdos.in &&
sleep 5

pp.x      -i La2Ru2-pp.in &&
dos.x     -i La2Ru2-dos.in &&
average.x -i La2Ru2-wf.ave.in > La2Ru2-wf.ave.out &&
mv avg.dat La2Ru2-avg.dat &&
sleep 10

projwfc.x -i La2Ru2-pdos.in &&
sleep 5

pp.x      -i La2Ta2-pp.in &&
dos.x     -i La2Ta2-dos.in &&
average.x -i La2Ta2-wf.ave.in > La2Ta2-wf.ave.out &&
mv avg.dat La2Ta2-avg.dat &&
sleep 10

projwfc.x -i La2Ta2-pdos.in &&
sleep 5

pp.x      -i La2Tc2-pp.in &&
dos.x     -i La2Tc2-dos.in &&
average.x -i La2Tc2-wf.ave.in > La2Tc2-wf.ave.out &&
mv avg.dat La2Tc2-avg.dat &&
sleep 10

projwfc.x -i La2Tc2-pdos.in &&
sleep 5

pp.x      -i La2W2-pp.in &&
dos.x     -i La2W2-dos.in &&
average.x -i La2W2-wf.ave.in > La2W2-wf.ave.out &&
mv avg.dat La2W2-avg.dat &&
sleep 10

projwfc.x -i La2W2-pdos.in &&
sleep 5

pp.x      -i La2Y2-pp.in &&
dos.x     -i La2Y2-dos.in &&
average.x -i La2Y2-wf.ave.in > La2Y2-wf.ave.out &&
mv avg.dat La2Y2-avg.dat &&
sleep 10

projwfc.x -i La2Y2-pdos.in &&
sleep 5

pp.x      -i La2Zr2-pp.in &&
dos.x     -i La2Zr2-dos.in &&
average.x -i La2Zr2-wf.ave.in > La2Zr2-wf.ave.out &&
mv avg.dat La2Zr2-avg.dat &&
sleep 10

projwfc.x -i La2Zr2-pdos.in &&
sleep 5

pp.x      -i Sc2La2-pp.in &&
dos.x     -i Sc2La2-dos.in &&
average.x -i Sc2La2-wf.ave.in > Sc2La2-wf.ave.out &&
mv avg.dat Sc2La2-avg.dat &&
sleep 10

projwfc.x -i Sc2La2-pdos.in &&
sleep 5

pp.x      -i Ti2La2-pp.in &&
dos.x     -i Ti2La2-dos.in &&
average.x -i Ti2La2-wf.ave.in > Ti2La2-wf.ave.out &&
mv avg.dat Ti2La2-avg.dat &&
sleep 10

projwfc.x -i Ti2La2-pdos.in &&
sleep 5

pp.x      -i V2La2-pp.in &&
dos.x     -i V2La2-dos.in &&
average.x -i V2La2-wf.ave.in > V2La2-wf.ave.out &&
mv avg.dat V2La2-avg.dat &&
sleep 10

projwfc.x -i V2La2-pdos.in &&
sleep 5

pp.x      -i Zn2La2-pp.in &&
dos.x     -i Zn2La2-dos.in &&
average.x -i Zn2La2-wf.ave.in > Zn2La2-wf.ave.out &&
mv avg.dat Zn2La2-avg.dat &&
sleep 10

projwfc.x -i Zn2La2-pdos.in &&
sleep 5

