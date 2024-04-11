./2022July04_05/#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=PP-05##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July04files.05.out     ##CHANGE
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
pp.x      -i Au2Hg2-pp.in &&
dos.x     -i Au2Hg2-dos.in &&
average.x -i Au2Hg2-wf.ave.in > Au2Hg2-wf.ave.out &&
mv avg.dat Au2Hg2-avg.dat &&
sleep 10

projwfc.x -i Au2Hg2-pdos.in &&
sleep 5

STR = "Au.pdos.out.pdos_atm#9\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#10\\(Au\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Au2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cd2Hg2-pp.in &&
dos.x     -i Cd2Hg2-dos.in &&
average.x -i Cd2Hg2-wf.ave.in > Cd2Hg2-wf.ave.out &&
mv avg.dat Cd2Hg2-avg.dat &&
sleep 10

projwfc.x -i Cd2Hg2-pdos.in &&
sleep 5

STR = "Cd.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cd2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cd2Os2-pp.in &&
dos.x     -i Cd2Os2-dos.in &&
average.x -i Cd2Os2-wf.ave.in > Cd2Os2-wf.ave.out &&
mv avg.dat Cd2Os2-avg.dat &&
sleep 10

projwfc.x -i Cd2Os2-pdos.in &&
sleep 5

STR = "Cd.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cd2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cd2Y2-pp.in &&
dos.x     -i Cd2Y2-dos.in &&
average.x -i Cd2Y2-wf.ave.in > Cd2Y2-wf.ave.out &&
mv avg.dat Cd2Y2-avg.dat &&
sleep 10

projwfc.x -i Cd2Y2-pdos.in &&
sleep 5

STR = "Cd.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cd2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cr2Hg2-pp.in &&
dos.x     -i Cr2Hg2-dos.in &&
average.x -i Cr2Hg2-wf.ave.in > Cr2Hg2-wf.ave.out &&
mv avg.dat Cr2Hg2-avg.dat &&
sleep 10

projwfc.x -i Cr2Hg2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cr2Nb2-pp.in &&
dos.x     -i Cr2Nb2-dos.in &&
average.x -i Cr2Nb2-wf.ave.in > Cr2Nb2-wf.ave.out &&
mv avg.dat Cr2Nb2-avg.dat &&
sleep 10

projwfc.x -i Cr2Nb2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Nb.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2Nb2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cr2Os2-pp.in &&
dos.x     -i Cr2Os2-dos.in &&
average.x -i Cr2Os2-wf.ave.in > Cr2Os2-wf.ave.out &&
mv avg.dat Cr2Os2-avg.dat &&
sleep 10

projwfc.x -i Cr2Os2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Cr2Y2-pp.in &&
dos.x     -i Cr2Y2-dos.in &&
average.x -i Cr2Y2-wf.ave.in > Cr2Y2-wf.ave.out &&
mv avg.dat Cr2Y2-avg.dat &&
sleep 10

projwfc.x -i Cr2Y2-pdos.in &&
sleep 5

STR = "Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Cr2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Mo2Hg2-pp.in &&
dos.x     -i Mo2Hg2-dos.in &&
average.x -i Mo2Hg2-wf.ave.in > Mo2Hg2-wf.ave.out &&
mv avg.dat Mo2Hg2-avg.dat &&
sleep 10

projwfc.x -i Mo2Hg2-pdos.in &&
sleep 5

STR = "Mo.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Mo2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Mo2Os2-pp.in &&
dos.x     -i Mo2Os2-dos.in &&
average.x -i Mo2Os2-wf.ave.in > Mo2Os2-wf.ave.out &&
mv avg.dat Mo2Os2-avg.dat &&
sleep 10

projwfc.x -i Mo2Os2-pdos.in &&
sleep 5

STR = "Mo.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Mo2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Mo2Y2-pp.in &&
dos.x     -i Mo2Y2-dos.in &&
average.x -i Mo2Y2-wf.ave.in > Mo2Y2-wf.ave.out &&
mv avg.dat Mo2Y2-avg.dat &&
sleep 10

projwfc.x -i Mo2Y2-pdos.in &&
sleep 5

STR = "Mo.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Mo2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Au2-pp.in &&
dos.x     -i Nb2Au2-dos.in &&
average.x -i Nb2Au2-wf.ave.in > Nb2Au2-wf.ave.out &&
mv avg.dat Nb2Au2-avg.dat &&
sleep 10

projwfc.x -i Nb2Au2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Cd2-pp.in &&
dos.x     -i Nb2Cd2-dos.in &&
average.x -i Nb2Cd2-wf.ave.in > Nb2Cd2-wf.ave.out &&
mv avg.dat Nb2Cd2-avg.dat &&
sleep 10

projwfc.x -i Nb2Cd2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Cd.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Cd2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Hg2-pp.in &&
dos.x     -i Nb2Hg2-dos.in &&
average.x -i Nb2Hg2-wf.ave.in > Nb2Hg2-wf.ave.out &&
mv avg.dat Nb2Hg2-avg.dat &&
sleep 10

projwfc.x -i Nb2Hg2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Mo2-pp.in &&
dos.x     -i Nb2Mo2-dos.in &&
average.x -i Nb2Mo2-wf.ave.in > Nb2Mo2-wf.ave.out &&
mv avg.dat Nb2Mo2-avg.dat &&
sleep 10

projwfc.x -i Nb2Mo2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Mo.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Mo2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Os2-pp.in &&
dos.x     -i Nb2Os2-dos.in &&
average.x -i Nb2Os2-wf.ave.in > Nb2Os2-wf.ave.out &&
mv avg.dat Nb2Os2-avg.dat &&
sleep 10

projwfc.x -i Nb2Os2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Rh2-pp.in &&
dos.x     -i Nb2Rh2-dos.in &&
average.x -i Nb2Rh2-wf.ave.in > Nb2Rh2-wf.ave.out &&
mv avg.dat Nb2Rh2-avg.dat &&
sleep 10

projwfc.x -i Nb2Rh2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Rh.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Rh2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Nb2Y2-pp.in &&
dos.x     -i Nb2Y2-dos.in &&
average.x -i Nb2Y2-wf.ave.in > Nb2Y2-wf.ave.out &&
mv avg.dat Nb2Y2-avg.dat &&
sleep 10

projwfc.x -i Nb2Y2-pdos.in &&
sleep 5

STR = "Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Nb2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Os2Au2-pp.in &&
dos.x     -i Os2Au2-dos.in &&
average.x -i Os2Au2-wf.ave.in > Os2Au2-wf.ave.out &&
mv avg.dat Os2Au2-avg.dat &&
sleep 10

projwfc.x -i Os2Au2-pdos.in &&
sleep 5

STR = "Os.pdos.out.pdos_atm#9\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#10\\(Os\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Os2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Os2Hg2-pp.in &&
dos.x     -i Os2Hg2-dos.in &&
average.x -i Os2Hg2-wf.ave.in > Os2Hg2-wf.ave.out &&
mv avg.dat Os2Hg2-avg.dat &&
sleep 10

projwfc.x -i Os2Hg2-pdos.in &&
sleep 5

STR = "Os.pdos.out.pdos_atm#9\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#10\\(Os\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Os2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Rh2Hg2-pp.in &&
dos.x     -i Rh2Hg2-dos.in &&
average.x -i Rh2Hg2-wf.ave.in > Rh2Hg2-wf.ave.out &&
mv avg.dat Rh2Hg2-avg.dat &&
sleep 10

projwfc.x -i Rh2Hg2-pdos.in &&
sleep 5

STR = "Rh.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Rh2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Rh2Os2-pp.in &&
dos.x     -i Rh2Os2-dos.in &&
average.x -i Rh2Os2-wf.ave.in > Rh2Os2-wf.ave.out &&
mv avg.dat Rh2Os2-avg.dat &&
sleep 10

projwfc.x -i Rh2Os2-pdos.in &&
sleep 5

STR = "Rh.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Rh2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Rh2Y2-pp.in &&
dos.x     -i Rh2Y2-dos.in &&
average.x -i Rh2Y2-wf.ave.in > Rh2Y2-wf.ave.out &&
mv avg.dat Rh2Y2-avg.dat &&
sleep 10

projwfc.x -i Rh2Y2-pdos.in &&
sleep 5

STR = "Rh.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Rh2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2Hg2-pp.in &&
dos.x     -i Sc2Hg2-dos.in &&
average.x -i Sc2Hg2-wf.ave.in > Sc2Hg2-wf.ave.out &&
mv avg.dat Sc2Hg2-avg.dat &&
sleep 10

projwfc.x -i Sc2Hg2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2Nb2-pp.in &&
dos.x     -i Sc2Nb2-dos.in &&
average.x -i Sc2Nb2-wf.ave.in > Sc2Nb2-wf.ave.out &&
mv avg.dat Sc2Nb2-avg.dat &&
sleep 10

projwfc.x -i Sc2Nb2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Nb.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2Nb2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2Os2-pp.in &&
dos.x     -i Sc2Os2-dos.in &&
average.x -i Sc2Os2-wf.ave.in > Sc2Os2-wf.ave.out &&
mv avg.dat Sc2Os2-avg.dat &&
sleep 10

projwfc.x -i Sc2Os2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Sc2Y2-pp.in &&
dos.x     -i Sc2Y2-dos.in &&
average.x -i Sc2Y2-wf.ave.in > Sc2Y2-wf.ave.out &&
mv avg.dat Sc2Y2-avg.dat &&
sleep 10

projwfc.x -i Sc2Y2-pdos.in &&
sleep 5

STR = "Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Sc2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Y2Au2-pp.in &&
dos.x     -i Y2Au2-dos.in &&
average.x -i Y2Au2-wf.ave.in > Y2Au2-wf.ave.out &&
mv avg.dat Y2Au2-avg.dat &&
sleep 10

projwfc.x -i Y2Au2-pdos.in &&
sleep 5

STR = "Y.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Y2Au2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Y2Hg2-pp.in &&
dos.x     -i Y2Hg2-dos.in &&
average.x -i Y2Hg2-wf.ave.in > Y2Hg2-wf.ave.out &&
mv avg.dat Y2Hg2-avg.dat &&
sleep 10

projwfc.x -i Y2Hg2-pdos.in &&
sleep 5

STR = "Y.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Y2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Y2Os2-pp.in &&
dos.x     -i Y2Os2-dos.in &&
average.x -i Y2Os2-wf.ave.in > Y2Os2-wf.ave.out &&
mv avg.dat Y2Os2-avg.dat &&
sleep 10

projwfc.x -i Y2Os2-pdos.in &&
sleep 5

STR = "Y.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Y2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zn2Hg2-pp.in &&
dos.x     -i Zn2Hg2-dos.in &&
average.x -i Zn2Hg2-wf.ave.in > Zn2Hg2-wf.ave.out &&
mv avg.dat Zn2Hg2-avg.dat &&
sleep 10

projwfc.x -i Zn2Hg2-pdos.in &&
sleep 5

STR = "Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zn2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zn2Nb2-pp.in &&
dos.x     -i Zn2Nb2-dos.in &&
average.x -i Zn2Nb2-wf.ave.in > Zn2Nb2-wf.ave.out &&
mv avg.dat Zn2Nb2-avg.dat &&
sleep 10

projwfc.x -i Zn2Nb2-pdos.in &&
sleep 5

STR = "Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Nb.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zn2Nb2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zn2Os2-pp.in &&
dos.x     -i Zn2Os2-dos.in &&
average.x -i Zn2Os2-wf.ave.in > Zn2Os2-wf.ave.out &&
mv avg.dat Zn2Os2-avg.dat &&
sleep 10

projwfc.x -i Zn2Os2-pdos.in &&
sleep 5

STR = "Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zn2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zn2Y2-pp.in &&
dos.x     -i Zn2Y2-dos.in &&
average.x -i Zn2Y2-wf.ave.in > Zn2Y2-wf.ave.out &&
mv avg.dat Zn2Y2-avg.dat &&
sleep 10

projwfc.x -i Zn2Y2-pdos.in &&
sleep 5

STR = "Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zn2Y2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zr2Hg2-pp.in &&
dos.x     -i Zr2Hg2-dos.in &&
average.x -i Zr2Hg2-wf.ave.in > Zr2Hg2-wf.ave.out &&
mv avg.dat Zr2Hg2-avg.dat &&
sleep 10

projwfc.x -i Zr2Hg2-pdos.in &&
sleep 5

STR = "Zr.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Hg.pdos.out.pdos_atm#11\\(Hg\\)*\(d\) Hg.pdos.out.pdos_atm#12\\(Hg\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zr2Hg2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zr2Nb2-pp.in &&
dos.x     -i Zr2Nb2-dos.in &&
average.x -i Zr2Nb2-wf.ave.in > Zr2Nb2-wf.ave.out &&
mv avg.dat Zr2Nb2-avg.dat &&
sleep 10

projwfc.x -i Zr2Nb2-pdos.in &&
sleep 5

STR = "Zr.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Nb.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zr2Nb2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zr2Os2-pp.in &&
dos.x     -i Zr2Os2-dos.in &&
average.x -i Zr2Os2-wf.ave.in > Zr2Os2-wf.ave.out &&
mv avg.dat Zr2Os2-avg.dat &&
sleep 10

projwfc.x -i Zr2Os2-pdos.in &&
sleep 5

STR = "Zr.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zr2Os2_top_layer_\(d\).dat`"
echo $STR

pp.x      -i Zr2Y2-pp.in &&
dos.x     -i Zr2Y2-dos.in &&
average.x -i Zr2Y2-wf.ave.in > Zr2Y2-wf.ave.out &&
mv avg.dat Zr2Y2-avg.dat &&
sleep 10

projwfc.x -i Zr2Y2-pdos.in &&
sleep 5

STR = "Zr.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x < ${STR} > atoms_Zr2Y2_top_layer_\(d\).dat`"
echo $STR

