./2022July04_06/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-06.2-##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.06.out     ##CHANGE
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
pp.x      -i Cd2Au2-pp.in &&
dos.x     -i Cd2Au2-dos.in &&
average.x -i Cd2Au2-wf.ave.in > Cd2Au2-wf.ave.out &&
mv avg.dat Cd2Au2-avg.dat &&
sleep 10

projwfc.x -i Cd2Au2-pdos.in &&
sleep 5

pp.x      -i Cr2Au2-pp.in &&
dos.x     -i Cr2Au2-dos.in &&
average.x -i Cr2Au2-wf.ave.in > Cr2Au2-wf.ave.out &&
mv avg.dat Cr2Au2-avg.dat &&
sleep 10

projwfc.x -i Cr2Au2-pdos.in &&
sleep 5

pp.x      -i Cr2Cd2-pp.in &&
dos.x     -i Cr2Cd2-dos.in &&
average.x -i Cr2Cd2-wf.ave.in > Cr2Cd2-wf.ave.out &&
mv avg.dat Cr2Cd2-avg.dat &&
sleep 10

projwfc.x -i Cr2Cd2-pdos.in &&
sleep 5

pp.x      -i Cr2Mo2-pp.in &&
dos.x     -i Cr2Mo2-dos.in &&
average.x -i Cr2Mo2-wf.ave.in > Cr2Mo2-wf.ave.out &&
mv avg.dat Cr2Mo2-avg.dat &&
sleep 10

projwfc.x -i Cr2Mo2-pdos.in &&
sleep 5

pp.x      -i Cr2Rh2-pp.in &&
dos.x     -i Cr2Rh2-dos.in &&
average.x -i Cr2Rh2-wf.ave.in > Cr2Rh2-wf.ave.out &&
mv avg.dat Cr2Rh2-avg.dat &&
sleep 10

projwfc.x -i Cr2Rh2-pdos.in &&
sleep 5

pp.x      -i Cr2Zn2-pp.in &&
dos.x     -i Cr2Zn2-dos.in &&
average.x -i Cr2Zn2-wf.ave.in > Cr2Zn2-wf.ave.out &&
mv avg.dat Cr2Zn2-avg.dat &&
sleep 10

projwfc.x -i Cr2Zn2-pdos.in &&
sleep 5

pp.x      -i Cr2Zr2-pp.in &&
dos.x     -i Cr2Zr2-dos.in &&
average.x -i Cr2Zr2-wf.ave.in > Cr2Zr2-wf.ave.out &&
mv avg.dat Cr2Zr2-avg.dat &&
sleep 10

projwfc.x -i Cr2Zr2-pdos.in &&
sleep 5

pp.x      -i Mo2Au2-pp.in &&
dos.x     -i Mo2Au2-dos.in &&
average.x -i Mo2Au2-wf.ave.in > Mo2Au2-wf.ave.out &&
mv avg.dat Mo2Au2-avg.dat &&
sleep 10

projwfc.x -i Mo2Au2-pdos.in &&
sleep 5

pp.x      -i Mo2Cd2-pp.in &&
dos.x     -i Mo2Cd2-dos.in &&
average.x -i Mo2Cd2-wf.ave.in > Mo2Cd2-wf.ave.out &&
mv avg.dat Mo2Cd2-avg.dat &&
sleep 10

projwfc.x -i Mo2Cd2-pdos.in &&
sleep 5

pp.x      -i Mo2Rh2-pp.in &&
dos.x     -i Mo2Rh2-dos.in &&
average.x -i Mo2Rh2-wf.ave.in > Mo2Rh2-wf.ave.out &&
mv avg.dat Mo2Rh2-avg.dat &&
sleep 10

projwfc.x -i Mo2Rh2-pdos.in &&
sleep 5

pp.x      -i Rh2Au2-pp.in &&
dos.x     -i Rh2Au2-dos.in &&
average.x -i Rh2Au2-wf.ave.in > Rh2Au2-wf.ave.out &&
mv avg.dat Rh2Au2-avg.dat &&
sleep 10

projwfc.x -i Rh2Au2-pdos.in &&
sleep 5

pp.x      -i Rh2Cd2-pp.in &&
dos.x     -i Rh2Cd2-dos.in &&
average.x -i Rh2Cd2-wf.ave.in > Rh2Cd2-wf.ave.out &&
mv avg.dat Rh2Cd2-avg.dat &&
sleep 10

projwfc.x -i Rh2Cd2-pdos.in &&
sleep 5

pp.x      -i Sc2Au2-pp.in &&
dos.x     -i Sc2Au2-dos.in &&
average.x -i Sc2Au2-wf.ave.in > Sc2Au2-wf.ave.out &&
mv avg.dat Sc2Au2-avg.dat &&
sleep 10

projwfc.x -i Sc2Au2-pdos.in &&
sleep 5

pp.x      -i Sc2Cd2-pp.in &&
dos.x     -i Sc2Cd2-dos.in &&
average.x -i Sc2Cd2-wf.ave.in > Sc2Cd2-wf.ave.out &&
mv avg.dat Sc2Cd2-avg.dat &&
sleep 10

projwfc.x -i Sc2Cd2-pdos.in &&
sleep 5

pp.x      -i Sc2Cr2-pp.in &&
dos.x     -i Sc2Cr2-dos.in &&
average.x -i Sc2Cr2-wf.ave.in > Sc2Cr2-wf.ave.out &&
mv avg.dat Sc2Cr2-avg.dat &&
sleep 10

projwfc.x -i Sc2Cr2-pdos.in &&
sleep 5

pp.x      -i Sc2Mo2-pp.in &&
dos.x     -i Sc2Mo2-dos.in &&
average.x -i Sc2Mo2-wf.ave.in > Sc2Mo2-wf.ave.out &&
mv avg.dat Sc2Mo2-avg.dat &&
sleep 10

projwfc.x -i Sc2Mo2-pdos.in &&
sleep 5

pp.x      -i Sc2Rh2-pp.in &&
dos.x     -i Sc2Rh2-dos.in &&
average.x -i Sc2Rh2-wf.ave.in > Sc2Rh2-wf.ave.out &&
mv avg.dat Sc2Rh2-avg.dat &&
sleep 10

projwfc.x -i Sc2Rh2-pdos.in &&
sleep 5

pp.x      -i Sc2Zn2-pp.in &&
dos.x     -i Sc2Zn2-dos.in &&
average.x -i Sc2Zn2-wf.ave.in > Sc2Zn2-wf.ave.out &&
mv avg.dat Sc2Zn2-avg.dat &&
sleep 10

projwfc.x -i Sc2Zn2-pdos.in &&
sleep 5

pp.x      -i Sc2Zr2-pp.in &&
dos.x     -i Sc2Zr2-dos.in &&
average.x -i Sc2Zr2-wf.ave.in > Sc2Zr2-wf.ave.out &&
mv avg.dat Sc2Zr2-avg.dat &&
sleep 10

projwfc.x -i Sc2Zr2-pdos.in &&
sleep 5

pp.x      -i Zn2Au2-pp.in &&
dos.x     -i Zn2Au2-dos.in &&
average.x -i Zn2Au2-wf.ave.in > Zn2Au2-wf.ave.out &&
mv avg.dat Zn2Au2-avg.dat &&
sleep 10

projwfc.x -i Zn2Au2-pdos.in &&
sleep 5

pp.x      -i Zn2Cd2-pp.in &&
dos.x     -i Zn2Cd2-dos.in &&
average.x -i Zn2Cd2-wf.ave.in > Zn2Cd2-wf.ave.out &&
mv avg.dat Zn2Cd2-avg.dat &&
sleep 10

projwfc.x -i Zn2Cd2-pdos.in &&
sleep 5

pp.x      -i Zn2Mo2-pp.in &&
dos.x     -i Zn2Mo2-dos.in &&
average.x -i Zn2Mo2-wf.ave.in > Zn2Mo2-wf.ave.out &&
mv avg.dat Zn2Mo2-avg.dat &&
sleep 10

projwfc.x -i Zn2Mo2-pdos.in &&
sleep 5

pp.x      -i Zn2Rh2-pp.in &&
dos.x     -i Zn2Rh2-dos.in &&
average.x -i Zn2Rh2-wf.ave.in > Zn2Rh2-wf.ave.out &&
mv avg.dat Zn2Rh2-avg.dat &&
sleep 10

projwfc.x -i Zn2Rh2-pdos.in &&
sleep 5

pp.x      -i Zr2Au2-pp.in &&
dos.x     -i Zr2Au2-dos.in &&
average.x -i Zr2Au2-wf.ave.in > Zr2Au2-wf.ave.out &&
mv avg.dat Zr2Au2-avg.dat &&
sleep 10

projwfc.x -i Zr2Au2-pdos.in &&
sleep 5

pp.x      -i Zr2Cd2-pp.in &&
dos.x     -i Zr2Cd2-dos.in &&
average.x -i Zr2Cd2-wf.ave.in > Zr2Cd2-wf.ave.out &&
mv avg.dat Zr2Cd2-avg.dat &&
sleep 10

projwfc.x -i Zr2Cd2-pdos.in &&
sleep 5

pp.x      -i Zr2Mo2-pp.in &&
dos.x     -i Zr2Mo2-dos.in &&
average.x -i Zr2Mo2-wf.ave.in > Zr2Mo2-wf.ave.out &&
mv avg.dat Zr2Mo2-avg.dat &&
sleep 10

projwfc.x -i Zr2Mo2-pdos.in &&
sleep 5

pp.x      -i Zr2Rh2-pp.in &&
dos.x     -i Zr2Rh2-dos.in &&
average.x -i Zr2Rh2-wf.ave.in > Zr2Rh2-wf.ave.out &&
mv avg.dat Zr2Rh2-avg.dat &&
sleep 10

projwfc.x -i Zr2Rh2-pdos.in &&
sleep 5

