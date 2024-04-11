#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PPm-00##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July11files.00.out     ##CHANGE
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
pp.x      -i Ag-pp.in > Ag-pp.out &&
dos.x     -i Ag-dos.in > Ag-dos.out &&
average.x -i Ag-wf.ave.in > Ag-wf.ave.out &&
mv avg.dat Ag-avg.dat &&
projwfc.x -i Ag-pdos.in > Ag-pdos.out &&
sleep 10

pp.x      -i Au-pp.in > Au-pp.out &&
dos.x     -i Au-dos.in > Au-dos.out &&
average.x -i Au-wf.ave.in > Au-wf.ave.out &&
mv avg.dat Au-avg.dat &&
projwfc.x -i Au-pdos.in > Au-pdos.out &&
sleep 10

pp.x      -i Cd-pp.in > Cd-pp.out &&
dos.x     -i Cd-dos.in > Cd-dos.out &&
average.x -i Cd-wf.ave.in > Cd-wf.ave.out &&
mv avg.dat Cd-avg.dat &&
projwfc.x -i Cd-pdos.in > Cd-pdos.out &&
sleep 10

pp.x      -i Co-pp.in > Co-pp.out &&
dos.x     -i Co-dos.in > Co-dos.out &&
average.x -i Co-wf.ave.in > Co-wf.ave.out &&
mv avg.dat Co-avg.dat &&
projwfc.x -i Co-pdos.in > Co-pdos.out &&
sleep 10

pp.x      -i Cr-pp.in > Cr-pp.out &&
dos.x     -i Cr-dos.in > Cr-dos.out &&
average.x -i Cr-wf.ave.in > Cr-wf.ave.out &&
mv avg.dat Cr-avg.dat &&
projwfc.x -i Cr-pdos.in > Cr-pdos.out &&
sleep 10

pp.x      -i Cu-pp.in > Cu-pp.out &&
dos.x     -i Cu-dos.in > Cu-dos.out &&
average.x -i Cu-wf.ave.in > Cu-wf.ave.out &&
mv avg.dat Cu-avg.dat &&
projwfc.x -i Cu-pdos.in > Cu-pdos.out &&
sleep 10

pp.x      -i Hf-pp.in > Hf-pp.out &&
dos.x     -i Hf-dos.in > Hf-dos.out &&
average.x -i Hf-wf.ave.in > Hf-wf.ave.out &&
mv avg.dat Hf-avg.dat &&
projwfc.x -i Hf-pdos.in > Hf-pdos.out &&
sleep 10

pp.x      -i Hg-pp.in > Hg-pp.out &&
dos.x     -i Hg-dos.in > Hg-dos.out &&
average.x -i Hg-wf.ave.in > Hg-wf.ave.out &&
mv avg.dat Hg-avg.dat &&
projwfc.x -i Hg-pdos.in > Hg-pdos.out &&
sleep 10

pp.x      -i Ir-pp.in > Ir-pp.out &&
dos.x     -i Ir-dos.in > Ir-dos.out &&
average.x -i Ir-wf.ave.in > Ir-wf.ave.out &&
mv avg.dat Ir-avg.dat &&
projwfc.x -i Ir-pdos.in > Ir-pdos.out &&
sleep 10

