./2022July04_14/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-14##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.14.out     ##CHANGE
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
pp.x      -i Fe2Cu2-pp.in &&
dos.x     -i Fe2Cu2-dos.in &&
average.x -i Fe2Cu2-wf.ave.in > Fe2Cu2-wf.ave.out &&
mv avg.dat Fe2Cu2-avg.dat &&
sleep 10

projwfc.x -i Fe2Cu2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Cu.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Cu2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Fe2Hf2-pp.in &&
dos.x     -i Fe2Hf2-dos.in &&
average.x -i Fe2Hf2-wf.ave.in > Fe2Hf2-wf.ave.out &&
mv avg.dat Fe2Hf2-avg.dat &&
sleep 10

projwfc.x -i Fe2Hf2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Hf2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Fe2Hg2-pp.in &&
dos.x     -i Fe2Hg2-dos.in &&
average.x -i Fe2Hg2-wf.ave.in > Fe2Hg2-wf.ave.out &&
mv avg.dat Fe2Hg2-avg.dat &&
sleep 10

projwfc.x -i Fe2Hg2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Hg2_top_layer_\(d\).dat`"
echo $STR

