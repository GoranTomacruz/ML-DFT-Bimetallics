#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP2-6.1##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July11files.06.out     ##CHANGE
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
pp.x      -i Cd2Au2-pp.in > Cd2Au2-pp.out &&
average.x -i Cd2Au2-wf.ave.in > Cd2Au2-wf.ave.out &&
mv avg.dat Cd2Au2-avg.dat &&
projwfc.x -i Cd2Au2-pdos.in > Cd2Au2-pdos.out &&
sleep 10

pp.x      -i Cr2Au2-pp.in > Cr2Au2-pp.out &&
average.x -i Cr2Au2-wf.ave.in > Cr2Au2-wf.ave.out &&
mv avg.dat Cr2Au2-avg.dat &&
projwfc.x -i Cr2Au2-pdos.in > Cr2Au2-pdos.out &&
sleep 10

pp.x      -i Cr2Cd2-pp.in > Cr2Cd2-pp.out &&
average.x -i Cr2Cd2-wf.ave.in > Cr2Cd2-wf.ave.out &&
mv avg.dat Cr2Cd2-avg.dat &&
projwfc.x -i Cr2Cd2-pdos.in > Cr2Cd2-pdos.out &&
sleep 10

pp.x      -i Cr2Mo2-pp.in > Cr2Mo2-pp.out &&
average.x -i Cr2Mo2-wf.ave.in > Cr2Mo2-wf.ave.out &&
mv avg.dat Cr2Mo2-avg.dat &&
projwfc.x -i Cr2Mo2-pdos.in > Cr2Mo2-pdos.out &&
sleep 10

pp.x      -i Cr2Rh2-pp.in > Cr2Rh2-pp.out &&
average.x -i Cr2Rh2-wf.ave.in > Cr2Rh2-wf.ave.out &&
mv avg.dat Cr2Rh2-avg.dat &&
projwfc.x -i Cr2Rh2-pdos.in > Cr2Rh2-pdos.out &&
sleep 10

pp.x      -i Cr2Zr2-pp.in > Cr2Zr2-pp.out &&
average.x -i Cr2Zr2-wf.ave.in > Cr2Zr2-wf.ave.out &&
mv avg.dat Cr2Zr2-avg.dat &&
projwfc.x -i Cr2Zr2-pdos.in > Cr2Zr2-pdos.out &&
sleep 10

pp.x      -i Mo2Au2-pp.in > Mo2Au2-pp.out &&
average.x -i Mo2Au2-wf.ave.in > Mo2Au2-wf.ave.out &&
mv avg.dat Mo2Au2-avg.dat &&
projwfc.x -i Mo2Au2-pdos.in > Mo2Au2-pdos.out &&
sleep 10

pp.x      -i Mo2Cd2-pp.in > Mo2Cd2-pp.out &&
average.x -i Mo2Cd2-wf.ave.in > Mo2Cd2-wf.ave.out &&
mv avg.dat Mo2Cd2-avg.dat &&
projwfc.x -i Mo2Cd2-pdos.in > Mo2Cd2-pdos.out &&
sleep 10

pp.x      -i Sc2Au2-pp.in > Sc2Au2-pp.out &&
average.x -i Sc2Au2-wf.ave.in > Sc2Au2-wf.ave.out &&
mv avg.dat Sc2Au2-avg.dat &&
projwfc.x -i Sc2Au2-pdos.in > Sc2Au2-pdos.out &&
sleep 10

pp.x      -i Sc2Cd2-pp.in > Sc2Cd2-pp.out &&
average.x -i Sc2Cd2-wf.ave.in > Sc2Cd2-wf.ave.out &&
mv avg.dat Sc2Cd2-avg.dat &&
projwfc.x -i Sc2Cd2-pdos.in > Sc2Cd2-pdos.out &&
sleep 10

pp.x      -i Sc2Cr2-pp.in > Sc2Cr2-pp.out &&
average.x -i Sc2Cr2-wf.ave.in > Sc2Cr2-wf.ave.out &&
mv avg.dat Sc2Cr2-avg.dat &&
projwfc.x -i Sc2Cr2-pdos.in > Sc2Cr2-pdos.out &&
sleep 10

pp.x      -i Sc2Mo2-pp.in > Sc2Mo2-pp.out &&
average.x -i Sc2Mo2-wf.ave.in > Sc2Mo2-wf.ave.out &&
mv avg.dat Sc2Mo2-avg.dat &&
projwfc.x -i Sc2Mo2-pdos.in > Sc2Mo2-pdos.out &&
sleep 10

pp.x      -i Sc2Rh2-pp.in > Sc2Rh2-pp.out &&
average.x -i Sc2Rh2-wf.ave.in > Sc2Rh2-wf.ave.out &&
mv avg.dat Sc2Rh2-avg.dat &&
projwfc.x -i Sc2Rh2-pdos.in > Sc2Rh2-pdos.out &&
sleep 10

pp.x      -i Sc2Zr2-pp.in > Sc2Zr2-pp.out &&
average.x -i Sc2Zr2-wf.ave.in > Sc2Zr2-wf.ave.out &&
mv avg.dat Sc2Zr2-avg.dat &&
projwfc.x -i Sc2Zr2-pdos.in > Sc2Zr2-pdos.out &&
sleep 10

pp.x      -i Zr2Au2-pp.in > Zr2Au2-pp.out &&
average.x -i Zr2Au2-wf.ave.in > Zr2Au2-wf.ave.out &&
mv avg.dat Zr2Au2-avg.dat &&
projwfc.x -i Zr2Au2-pdos.in > Zr2Au2-pdos.out &&
sleep 10

pp.x      -i Zr2Cd2-pp.in > Zr2Cd2-pp.out &&
average.x -i Zr2Cd2-wf.ave.in > Zr2Cd2-wf.ave.out &&
mv avg.dat Zr2Cd2-avg.dat &&
projwfc.x -i Zr2Cd2-pdos.in > Zr2Cd2-pdos.out &&
sleep 10

pp.x      -i Zr2Mo2-pp.in > Zr2Mo2-pp.out &&
average.x -i Zr2Mo2-wf.ave.in > Zr2Mo2-wf.ave.out &&
mv avg.dat Zr2Mo2-avg.dat &&
projwfc.x -i Zr2Mo2-pdos.in > Zr2Mo2-pdos.out &&
sleep 10

pp.x      -i Zr2Rh2-pp.in > Zr2Rh2-pp.out &&
average.x -i Zr2Rh2-wf.ave.in > Zr2Rh2-wf.ave.out &&
mv avg.dat Zr2Rh2-avg.dat &&
projwfc.x -i Zr2Rh2-pdos.in > Zr2Rh2-pdos.out &&
sleep 10

