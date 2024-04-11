#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-02##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July14files.02.out     ##CHANGE
#SBATCH --error=2022July14files.02.err     ##CHANGE
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
STR="Ag2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ag2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ag2Ir2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Ir2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ag2Ir2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Ir2.pdos.out.pdos_atm#10\\(Ag\\)*\(d\) Ag2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ag2Ir2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ir2_top-A_\(d\).dat`"
echo $STR

STR="Ag2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ir2_top-B_\(d\).dat`"
echo $STR

STR="Ag2Ir2.pdos.out.pdos_atm#9\\(Ag\\)*\(d\) Ag2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ag2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ag2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Cd2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Cd2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cd2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ir2_top-B_\(d\).dat`"
echo $STR

STR="Cd2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ir2_top-B_\(d\).dat`"
echo $STR

STR="Cd2Ir2.pdos.out.pdos_atm#9\\(Cd\\)*\(d\) Cd2Ir2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cd2Ir2.pdos.out.pdos_atm#10\\(Cd\\)*\(d\) Cd2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Cd2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cd2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ir2_top-B_\(d\).dat`"
echo $STR

STR="Cr2Ir2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ir2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Ir2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ir2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cr2Ir2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Cr2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Ir2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Cr2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cr2Ir2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ir2_top-A_\(d\).dat`"
echo $STR

STR="Cr2Ir2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Ir2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cr2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Cr2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Cr2Tc2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Tc2_top-A_\(d\).dat`"
echo $STR

STR="Cr2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Tc2_top-B_\(d\).dat`"
echo $STR

STR="Cr2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Cr2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Tc2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cr2Tc2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Cr2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Tc2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Tc2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Tc2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Cr2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Tc2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Cr2Tc2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Tc2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Tc2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cr2Tc2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Tc2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Cr2Tc2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Tc2_bridge-A_B-B_\(d\).dat`"
echo $STR

STR="Cr2Tc2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Tc2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Tc2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Tc2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Cr2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Tc2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Ir2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ir2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Ir2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ir2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Ir2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Cu2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Ir2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Cu2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Cu2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cu2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Ir2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Tc2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Tc2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Tc2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Tc2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Tc2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Tc2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Tc2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Cu2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Tc2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Tc2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Cu2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Tc2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Cu2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Tc2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Cu2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Tc2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ir2Au2.pdos.out.pdos_atm#9\\(Ir\\)*\(d\) Ir2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Ir2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Au2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ir2Au2.pdos.out.pdos_atm#10\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Au2_top-B_\(d\).dat`"
echo $STR

STR="Ir2Au2.pdos.out.pdos_atm#9\\(Ir\\)*\(d\) Ir2Au2.pdos.out.pdos_atm#10\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Au2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Ir2Hg2.pdos.out.pdos_atm#10\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Hg2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ir2Pt2.pdos.out.pdos_atm#9\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Pt2_top-A_\(d\).dat`"
echo $STR

STR="Ir2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Pt2_top-B_\(d\).dat`"
echo $STR

STR="Ir2Pt2.pdos.out.pdos_atm#9\\(Ir\\)*\(d\) Ir2Pt2.pdos.out.pdos_atm#10\\(Ir\\)*\(d\) Ir2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Pt2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ir2Pt2.pdos.out.pdos_atm#9\\(Ir\\)*\(d\) Ir2Pt2.pdos.out.pdos_atm#10\\(Ir\\)*\(d\) Ir2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Pt2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ir2Pt2.pdos.out.pdos_atm#10\\(Ir\\)*\(d\) Ir2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Ir2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Pt2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ir2Pt2.pdos.out.pdos_atm#9\\(Ir\\)*\(d\) Ir2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Ir2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Pt2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ir2Pt2.pdos.out.pdos_atm#9\\(Ir\\)*\(d\) Ir2Pt2.pdos.out.pdos_atm#10\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Pt2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ir2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Ir2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Pt2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ir2Pt2.pdos.out.pdos_atm#10\\(Ir\\)*\(d\) Ir2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Pt2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Ir2Pt2.pdos.out.pdos_atm#9\\(Ir\\)*\(d\) Ir2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ir2Pt2_bridge-A_B-B_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Ir2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Mo2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mo2Ir2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Mo2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mo2Ir2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ir2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mo2Ir2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ir2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mo2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Mo2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mo2Ir2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Ir2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Mo2Ir2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Ir2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Mo2Tc2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Tc2_top-A_\(d\).dat`"
echo $STR

STR="Mo2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Tc2_top-B_\(d\).dat`"
echo $STR

STR="Mo2Tc2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Tc2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Tc2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mo2Tc2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Tc2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Tc2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Mo2Tc2.pdos.out.pdos_atm#10\\(Mo\\)*\(d\) Mo2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Mo2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Tc2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mo2Tc2.pdos.out.pdos_atm#9\\(Mo\\)*\(d\) Mo2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Mo2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mo2Tc2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Ir2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Nb2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Nb2Ir2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Nb2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Nb2Ir2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ir2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Nb2Ir2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ir2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Nb2Ir2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Ir2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Nb2Ir2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Ir2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Nb2Tc2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Tc2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Tc2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Nb2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Nb2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Tc2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Nb2Tc2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Tc2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Tc2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Nb2Tc2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Tc2_top-A_\(d\).dat`"
echo $STR

STR="Nb2Tc2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Nb2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Tc2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Nb2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Tc2_top-B_\(d\).dat`"
echo $STR

STR="Nb2Tc2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Tc2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Tc2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Nb2Tc2.pdos.out.pdos_atm#9\\(Nb\\)*\(d\) Nb2Tc2.pdos.out.pdos_atm#10\\(Nb\\)*\(d\) Nb2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Nb2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Nb2Tc2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Os2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Os2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Os2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Os2Ir2.pdos.out.pdos_atm#9\\(Os\\)*\(d\) Os2Ir2.pdos.out.pdos_atm#10\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Os2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Os2Ir2.pdos.out.pdos_atm#10\\(Os\\)*\(d\) Os2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Os2Ir2_bridge-A_B-B_\(d\).dat`"
echo $STR

STR="Os2Ir2.pdos.out.pdos_atm#10\\(Os\\)*\(d\) Os2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Os2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Os2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Os2Ir2.pdos.out.pdos_atm#9\\(Os\\)*\(d\) Os2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Os2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Os2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Os2Ir2.pdos.out.pdos_atm#9\\(Os\\)*\(d\) Os2Ir2.pdos.out.pdos_atm#10\\(Os\\)*\(d\) Os2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Os2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Os2Ir2.pdos.out.pdos_atm#9\\(Os\\)*\(d\) Os2Ir2.pdos.out.pdos_atm#10\\(Os\\)*\(d\) Os2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Os2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Os2Ir2.pdos.out.pdos_atm#10\\(Os\\)*\(d\) Os2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Os2Ir2_bridge-A_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Re2Ir2.pdos.out.pdos_atm#10\\(Re\\)*\(d\) Re2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Re2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Re2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Re2Ir2.pdos.out.pdos_atm#9\\(Re\\)*\(d\) Re2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Re2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Re2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Re2Ir2.pdos.out.pdos_atm#9\\(Re\\)*\(d\) Re2Ir2.pdos.out.pdos_atm#10\\(Re\\)*\(d\) Re2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Re2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Re2Ir2.pdos.out.pdos_atm#9\\(Re\\)*\(d\) Re2Ir2.pdos.out.pdos_atm#10\\(Re\\)*\(d\) Re2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Re2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Re2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Re2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Re2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Re2Ir2.pdos.out.pdos_atm#9\\(Re\\)*\(d\) Re2Ir2.pdos.out.pdos_atm#10\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Re2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Re2Ir2.pdos.out.pdos_atm#10\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Re2Ir2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Rh2Ir2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Rh2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Rh2Ir2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Rh2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Rh2Ir2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Ir2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Rh2Ir2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Ir2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Rh2Ir2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ir2_top-B_\(d\).dat`"
echo $STR

STR="Rh2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Rh2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Rh2Ir2.pdos.out.pdos_atm#9\\(Rh\\)*\(d\) Rh2Ir2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Rh2Ir2.pdos.out.pdos_atm#10\\(Rh\\)*\(d\) Rh2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Rh2Ir2_bridge-A_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Ru2Ir2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ru2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ru2Ir2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ru2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Ir2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ir2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ru2Ir2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ir2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) Ru2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ru2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ru2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ru2Ir2.pdos.out.pdos_atm#9\\(Ru\\)*\(d\) Ru2Ir2.pdos.out.pdos_atm#10\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ru2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Sc2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Sc2Ir2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ir2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Sc2Ir2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ir2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Sc2Ir2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Ir2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Sc2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Ir2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Sc2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Tc2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Sc2Tc2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Tc2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Tc2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Sc2Tc2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Sc2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Tc2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Sc2Tc2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Tc2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Sc2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Tc2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Ag2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ag2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ag2_bridge-B_B-B_\(d\).dat`"
echo $STR

STR="Tc2Ag2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ag2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ag2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Ag2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Tc2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ag2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Ag2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ag2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ag2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Tc2Ag2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Tc2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ag2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Au2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Au2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Au2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Tc2Au2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Au2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Au2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Au2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Tc2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Au2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Au2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Au2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Cd2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Cd2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Cd2_bridge-B_B-B_\(d\).dat`"
echo $STR

STR="Tc2Cd2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Cd2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Cd2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Tc2Cd2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Tc2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Cd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Cd2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Cd2_top-B_\(d\).dat`"
echo $STR

STR="Tc2Cd2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Cd2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Tc2Cd2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Cd2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Cd2_bridge-B_B-B_\(d\).dat`"
echo $STR

sleep 10

sleep 10

STR="Tc2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ir2_top-A_\(d\).dat`"
echo $STR

STR="Tc2Ir2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Tc2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Ir2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Tc2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Ir2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ir2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Ir2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ir2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Ir2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ir2_top-B_\(d\).dat`"
echo $STR

STR="Tc2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Tc2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Tc2Ir2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ir2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Os2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Tc2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Os2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Os2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Tc2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Os2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Os2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Os2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Os2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Os2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Os2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Os2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Os2_top-A_\(d\).dat`"
echo $STR

STR="Tc2Os2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Os2_top-B_\(d\).dat`"
echo $STR

STR="Tc2Os2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Os2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Os2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Pt2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Tc2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Pt2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Pt2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Tc2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Pt2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Pt2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Pt2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Pt2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Pt2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Pt2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Pt2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Pt2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Pt2_top-B_\(d\).dat`"
echo $STR

STR="Tc2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Tc2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Pt2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Tc2Pt2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Pt2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Pt2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Re2_top-A_\(d\).dat`"
echo $STR

STR="Tc2Re2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Re2_top-B_\(d\).dat`"
echo $STR

STR="Tc2Re2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Tc2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Re2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Re2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Tc2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Re2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Re2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Re2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Re2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Re2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Re2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Re2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Tc2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Re2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Rh2_top-A_\(d\).dat`"
echo $STR

STR="Tc2Rh2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Tc2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Rh2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Rh2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Tc2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Rh2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Rh2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Rh2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Rh2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Rh2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Rh2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Rh2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Tc2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Rh2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Tc2Rh2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Rh2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Ru2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Tc2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ru2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Ru2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Tc2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ru2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Ru2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ru2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ru2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Tc2Ru2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Ru2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ru2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Tc2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Tc2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Ru2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="Tc2Y2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Y2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Y2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Tc2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Y2_top-B_\(d\).dat`"
echo $STR

STR="Tc2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Tc2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Y2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Tc2Y2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Y2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Tc2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Y2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Tc2Y2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Y2_top-A_\(d\).dat`"
echo $STR

STR="Tc2Y2.pdos.out.pdos_atm#9\\(Tc\\)*\(d\) Tc2Y2.pdos.out.pdos_atm#10\\(Tc\\)*\(d\) Tc2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Tc2Y2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Ir2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Ti2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Ir2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ti2Ir2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Ir2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ti2Ir2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Ir2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Ti2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Tc2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ti2Tc2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Tc2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Tc2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ti2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Tc2_top-A_\(d\).dat`"
echo $STR

STR="Ti2Tc2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Tc2_top-B_\(d\).dat`"
echo $STR

STR="Ti2Tc2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Ti2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Tc2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ti2Tc2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Tc2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Tc2_bridge-B_B-A_\(d\).dat`"
echo $STR

sleep 10

STR="Y2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Y2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Y2Ir2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Ir2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Y2Ir2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Ir2_top-B_\(d\).dat`"
echo $STR

STR="Y2Ir2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Ir2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Y2Ir2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Ir2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Y2Ir2.pdos.out.pdos_atm#9\\(Y\\)*\(d\) Y2Ir2.pdos.out.pdos_atm#10\\(Y\\)*\(d\) Y2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Y2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Y2Ir2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ir2_top-A_\(d\).dat`"
echo $STR

STR="Zn2Ir2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ir2_top-B_\(d\).dat`"
echo $STR

STR="Zn2Ir2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ir2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Zn2Ir2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ir2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zn2Ir2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ir2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Zn2Ir2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ir2_bridge-A_B-B_\(d\).dat`"
echo $STR

STR="Zn2Ir2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ir2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Ir2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ir2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Tc2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Tc2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Tc2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Tc2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Tc2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Tc2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Tc2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Zn2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Tc2_top-A_\(d\).dat`"
echo $STR

STR="Zn2Tc2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Tc2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Tc2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Tc2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Tc2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Tc2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Ir2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ir2_top-B_\(d\).dat`"
echo $STR

STR="Zr2Ir2.pdos.out.pdos_atm#11\\(Ir\\)*\(d\) Zr2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ir2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zr2Ir2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Ir2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Ir2.pdos.out.pdos_atm#12\\(Ir\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Ir2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Zr2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Tc2_top-A_\(d\).dat`"
echo $STR

STR="Zr2Tc2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Tc2_top-B_\(d\).dat`"
echo $STR

STR="Zr2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Zr2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Tc2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zr2Tc2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Tc2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Tc2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zr2Tc2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Tc2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Zr2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Tc2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Zr2Tc2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Tc2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Tc2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zr2Tc2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Zr2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Tc2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zr2Tc2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) Zr2Tc2.pdos.out.pdos_atm#12\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Tc2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zr2Tc2.pdos.out.pdos_atm#9\\(Zr\\)*\(d\) Zr2Tc2.pdos.out.pdos_atm#10\\(Zr\\)*\(d\) Zr2Tc2.pdos.out.pdos_atm#11\\(Tc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zr2Tc2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

