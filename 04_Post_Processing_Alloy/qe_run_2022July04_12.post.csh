./2022July04_12/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-12##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.12.out     ##CHANGE
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
pp.x      -i Co2Fe2-pp.in &&
dos.x     -i Co2Fe2-dos.in &&
average.x -i Co2Fe2-wf.ave.in > Co2Fe2-wf.ave.out &&
mv avg.dat Co2Fe2-avg.dat &&
sleep 10

projwfc.x -i Co2Fe2-pdos.in &&
sleep 5

STR = "Co.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Fe.pdos.out.pdos_atm#11\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#12\\(Fe\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Co2Fe2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cr2Fe2-pp.in &&
dos.x     -i Cr2Fe2-dos.in &&
average.x -i Cr2Fe2-wf.ave.in > Cr2Fe2-wf.ave.out &&
mv avg.dat Cr2Fe2-avg.dat &&
sleep 10

projwfc.x -i Cr2Fe2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Fe.pdos.out.pdos_atm#11\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#12\\(Fe\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2Fe2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Fe2La2-pp.in &&
dos.x     -i Fe2La2-dos.in &&
average.x -i Fe2La2-wf.ave.in > Fe2La2-wf.ave.out &&
mv avg.dat Fe2La2-avg.dat &&
sleep 10

projwfc.x -i Fe2La2-pdos.in &&
sleep 5

STR = "Fe.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) La.pdos.out.pdos_atm#11\\(La\\)*\(d\) La.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Fe2La2_top_layer_\(d\).dat`"
echo $STR

