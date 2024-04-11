#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-00##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July17files.00.out     ##CHANGE
#SBATCH --error=2022July17files.00.err     ##CHANGE
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
STR="Ag.pdos.out.pdos_atm#5\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#6\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#7\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#8\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Ag.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Au.pdos.out.pdos_atm#5\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#6\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#7\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#8\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#9\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#10\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Au.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Au_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cd.pdos.out.pdos_atm#5\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#6\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#7\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#8\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Cd.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Co.pdos.out.pdos_atm#5\\(Co\\)*\(d\) Co.pdos.out.pdos_atm#6\\(Co\\)*\(d\) Co.pdos.out.pdos_atm#7\\(Co\\)*\(d\) Co.pdos.out.pdos_atm#8\\(Co\\)*\(d\) Co.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co.pdos.out.pdos_atm#11\\(Co\\)*\(d\) Co.pdos.out.pdos_atm#12\\(Co\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cr.pdos.out.pdos_atm#5\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#6\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#7\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#8\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#11\\(Cr\\)*\(d\) Cr.pdos.out.pdos_atm#12\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Cu.pdos.out.pdos_atm#5\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#6\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#7\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#8\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#11\\(Cu\\)*\(d\) Cu.pdos.out.pdos_atm#12\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Hf.pdos.out.pdos_atm#5\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#6\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#7\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#8\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#9\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#10\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Hf.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Hf_two-layers_\(d\).dat`"
echo $STR

sleep 10

sleep 10

STR="Ir.pdos.out.pdos_atm#5\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#6\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#7\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#8\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#9\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#10\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ir.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="La.pdos.out.pdos_atm#5\\(La\\)*\(d\) La.pdos.out.pdos_atm#6\\(La\\)*\(d\) La.pdos.out.pdos_atm#7\\(La\\)*\(d\) La.pdos.out.pdos_atm#8\\(La\\)*\(d\) La.pdos.out.pdos_atm#9\\(La\\)*\(d\) La.pdos.out.pdos_atm#10\\(La\\)*\(d\) La.pdos.out.pdos_atm#11\\(La\\)*\(d\) La.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > La_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Mo.pdos.out.pdos_atm#5\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#6\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#7\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#8\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Mo.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Nb.pdos.out.pdos_atm#5\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#6\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#7\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#8\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Nb.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Os.pdos.out.pdos_atm#5\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#6\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#7\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#8\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#9\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#10\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Os.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Os_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pd.pdos.out.pdos_atm#5\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#6\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#7\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#8\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#9\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#10\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Pd.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pd_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Pt.pdos.out.pdos_atm#5\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#6\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#7\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#8\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#9\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#10\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Pt.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Pt_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Re.pdos.out.pdos_atm#5\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#6\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#7\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#8\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#9\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#10\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Re.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Re_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Rh.pdos.out.pdos_atm#5\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#6\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#7\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#8\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Rh.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ru.pdos.out.pdos_atm#5\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#6\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#7\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#8\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Ru.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Sc.pdos.out.pdos_atm#5\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#6\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#7\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#8\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#11\\(Sc\\)*\(d\) Sc.pdos.out.pdos_atm#12\\(Sc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ta.pdos.out.pdos_atm#5\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#6\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#7\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#8\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#9\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#10\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Ta.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ta_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Tc.pdos.out.pdos_atm#5\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#6\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#7\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#8\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Tc.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Ti.pdos.out.pdos_atm#5\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#6\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#7\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#8\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#11\\(Ti\\)*\(d\) Ti.pdos.out.pdos_atm#12\\(Ti\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="V.pdos.out.pdos_atm#5\\(V\\)*\(d\) V.pdos.out.pdos_atm#6\\(V\\)*\(d\) V.pdos.out.pdos_atm#7\\(V\\)*\(d\) V.pdos.out.pdos_atm#8\\(V\\)*\(d\) V.pdos.out.pdos_atm#9\\(V\\)*\(d\) V.pdos.out.pdos_atm#10\\(V\\)*\(d\) V.pdos.out.pdos_atm#11\\(V\\)*\(d\) V.pdos.out.pdos_atm#12\\(V\\)*\(d\) "
STR="`sumpdos.x ${STR} > V_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="W.pdos.out.pdos_atm#5\\(W\\)*\(d\) W.pdos.out.pdos_atm#6\\(W\\)*\(d\) W.pdos.out.pdos_atm#7\\(W\\)*\(d\) W.pdos.out.pdos_atm#8\\(W\\)*\(d\) W.pdos.out.pdos_atm#9\\(W\\)*\(d\) W.pdos.out.pdos_atm#10\\(W\\)*\(d\) W.pdos.out.pdos_atm#11\\(W\\)*\(d\) W.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > W_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Y.pdos.out.pdos_atm#5\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#6\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#7\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#8\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Y.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zn.pdos.out.pdos_atm#5\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#6\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#7\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#8\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Zn.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn_two-layers_\(d\).dat`"
echo $STR

sleep 10

STR="Zr.pdos.out.pdos_atm#5\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#6\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#7\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#8\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Zr.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr_two-layers_\(d\).dat`"
echo $STR

sleep 10

