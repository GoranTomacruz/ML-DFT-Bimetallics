./2022July04_15/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-15##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.15.out     ##CHANGE
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
pp.x      -i Fe2Ir2-pp.in &&
dos.x     -i Fe2Ir2-dos.in &&
average.x -i Fe2Ir2-wf.ave.in > Fe2Ir2-wf.ave.out &&
mv avg.dat Fe2Ir2-avg.dat &&
sleep 10

projwfc.x -i Fe2Ir2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Ir2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Fe2Ni2-pp.in &&
dos.x     -i Fe2Ni2-dos.in &&
average.x -i Fe2Ni2-wf.ave.in > Fe2Ni2-wf.ave.out &&
mv avg.dat Fe2Ni2-avg.dat &&
sleep 10

projwfc.x -i Fe2Ni2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Ni.pdos.out.pdos_atm#11\\(Ni\\)*\(d\) Ni.pdos.out.pdos_atm#12\\(Ni\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Ni2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Fe2Os2-pp.in &&
dos.x     -i Fe2Os2-dos.in &&
average.x -i Fe2Os2-wf.ave.in > Fe2Os2-wf.ave.out &&
mv avg.dat Fe2Os2-avg.dat &&
sleep 10

projwfc.x -i Fe2Os2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2Os2_top_layer_\(d\).dat`"
echo $STR
