#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PPm-02##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July11files.02.out     ##CHANGE
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
pp.x      -i Sc-pp.in > Sc-pp.out &&
dos.x     -i Sc-dos.in > Sc-dos.out &&
average.x -i Sc-wf.ave.in > Sc-wf.ave.out &&
mv avg.dat Sc-avg.dat &&
projwfc.x -i Sc-pdos.in > Sc-pdos.out &&
sleep 10

pp.x      -i Ta-pp.in > Ta-pp.out &&
dos.x     -i Ta-dos.in > Ta-dos.out &&
average.x -i Ta-wf.ave.in > Ta-wf.ave.out &&
mv avg.dat Ta-avg.dat &&
projwfc.x -i Ta-pdos.in > Ta-pdos.out &&
sleep 10

pp.x      -i Tc-pp.in > Tc-pp.out &&
dos.x     -i Tc-dos.in > Tc-dos.out &&
average.x -i Tc-wf.ave.in > Tc-wf.ave.out &&
mv avg.dat Tc-avg.dat &&
projwfc.x -i Tc-pdos.in > Tc-pdos.out &&
sleep 10

pp.x      -i Ti-pp.in > Ti-pp.out &&
dos.x     -i Ti-dos.in > Ti-dos.out &&
average.x -i Ti-wf.ave.in > Ti-wf.ave.out &&
mv avg.dat Ti-avg.dat &&
projwfc.x -i Ti-pdos.in > Ti-pdos.out &&
sleep 10

pp.x      -i V-pp.in > V-pp.out &&
dos.x     -i V-dos.in > V-dos.out &&
average.x -i V-wf.ave.in > V-wf.ave.out &&
mv avg.dat V-avg.dat &&
projwfc.x -i V-pdos.in > V-pdos.out &&
sleep 10

pp.x      -i W-pp.in > W-pp.out &&
dos.x     -i W-dos.in > W-dos.out &&
average.x -i W-wf.ave.in > W-wf.ave.out &&
mv avg.dat W-avg.dat &&
projwfc.x -i W-pdos.in > W-pdos.out &&
sleep 10

pp.x      -i Y-pp.in > Y-pp.out &&
dos.x     -i Y-dos.in > Y-dos.out &&
average.x -i Y-wf.ave.in > Y-wf.ave.out &&
mv avg.dat Y-avg.dat &&
projwfc.x -i Y-pdos.in > Y-pdos.out &&
sleep 10

pp.x      -i Zn-pp.in > Zn-pp.out &&
dos.x     -i Zn-dos.in > Zn-dos.out &&
average.x -i Zn-wf.ave.in > Zn-wf.ave.out &&
mv avg.dat Zn-avg.dat &&
projwfc.x -i Zn-pdos.in > Zn-pdos.out &&
sleep 10

pp.x      -i Zr-pp.in > Zr-pp.out &&
dos.x     -i Zr-dos.in > Zr-dos.out &&
average.x -i Zr-wf.ave.in > Zr-wf.ave.out &&
mv avg.dat Zr-avg.dat &&
projwfc.x -i Zr-pdos.in > Zr-pdos.out &&
sleep 10

