#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=SP-19##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks=4           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022July14files.19.out     ##CHANGE
#SBATCH --error=2022July14files.19.err     ##CHANGE
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
STR="Cr2Zn2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Zn2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Zn2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="Cr2Zn2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Zn2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Zn2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cr2Zn2.pdos.out.pdos_atm#10\\(Cr\\)*\(d\) Cr2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Cr2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cr2Zn2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) Cr2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Cr2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Zn2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cr2Zn2.pdos.out.pdos_atm#9\\(Cr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Zn2_top-A_\(d\).dat`"
echo $STR

STR="Cr2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cr2Zn2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Cu2Zn2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zn2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Cu2Zn2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Zn2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zn2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Cu2Zn2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zn2_top-A_\(d\).dat`"
echo $STR

STR="Cu2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zn2_top-B_\(d\).dat`"
echo $STR

STR="Cu2Zn2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zn2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Cu2Zn2.pdos.out.pdos_atm#9\\(Cu\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#10\\(Cu\\)*\(d\) Cu2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Cu2Zn2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Sc2Zn2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Zn2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Sc2Zn2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Zn2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Sc2Zn2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Zn2_top-A_\(d\).dat`"
echo $STR

STR="Sc2Zn2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Zn2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Sc2Zn2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#10\\(Sc\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Zn2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Sc2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Zn2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Sc2Zn2.pdos.out.pdos_atm#9\\(Sc\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Sc2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Sc2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Ti2Zn2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Zn2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="Ti2Zn2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Zn2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ti2Zn2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Zn2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ti2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Zn2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Ti2Zn2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ti2Zn2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Zn2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ti2Zn2.pdos.out.pdos_atm#9\\(Ti\\)*\(d\) Ti2Zn2.pdos.out.pdos_atm#10\\(Ti\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ti2Zn2_bridge-A_A-B_\(d\).dat`"
echo $STR

sleep 10

STR="V2Zn2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Zn2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="V2Zn2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Zn2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="V2Zn2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) V2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="V2Zn2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) V2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Zn2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="V2Zn2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#10\\(V\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Zn2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="V2Zn2.pdos.out.pdos_atm#9\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#10\\(V\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Zn2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="V2Zn2.pdos.out.pdos_atm#10\\(V\\)*\(d\) V2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) V2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > V2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Ag2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ag2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zn2Ag2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ag2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Zn2Ag2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ag2_top-B_\(d\).dat`"
echo $STR

STR="Zn2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ag2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Ag2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ag2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Zn2Ag2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ag2_bridge-A_B-B_\(d\).dat`"
echo $STR

STR="Zn2Ag2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ag2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Ag2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#11\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ag2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Ag2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ag2.pdos.out.pdos_atm#12\\(Ag\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ag2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Fe2Zn2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Zn2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Fe2Zn2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Fe2Zn2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Zn2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Fe2Zn2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Zn2_top-A_\(d\).dat`"
echo $STR

STR="Fe2Zn2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Zn2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Fe2Zn2.pdos.out.pdos_atm#9\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#10\\(Fe\\)*\(d\) Fe2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Fe2Zn2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Cd2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Cd2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Cd2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Cd2_top-B_\(d\).dat`"
echo $STR

STR="Zn2Cd2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Cd2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zn2Cd2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Cd2_bridge-A_B-B_\(d\).dat`"
echo $STR

STR="Zn2Cd2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Cd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Cd2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Cd2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Cd2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Cd2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Cd2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#11\\(Cd\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Cd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Cd2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Cd2.pdos.out.pdos_atm#12\\(Cd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Cd2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Hf2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Hf2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Zn2Hf2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_top-B_\(d\).dat`"
echo $STR

STR="Zn2Hf2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#12\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Hf2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Hf2.pdos.out.pdos_atm#11\\(Hf\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Hf2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

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

STR="Zn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2La2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="Zn2La2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2La2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2La2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2La2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2La2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zn2La2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2La2.pdos.out.pdos_atm#11\\(La\\)*\(d\) Zn2La2.pdos.out.pdos_atm#12\\(La\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2La2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Mo2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Mo2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Mo2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Mo2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Mo2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Mo2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Mo2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Mo2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Mo2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Mo2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Mo2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zn2Mo2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Mo2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Mo2_top-A_\(d\).dat`"
echo $STR

STR="Zn2Mo2.pdos.out.pdos_atm#11\\(Mo\\)*\(d\) Zn2Mo2.pdos.out.pdos_atm#12\\(Mo\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Mo2_bridge-A_A-A_\(d\).dat`"
echo $STR

sleep 10

STR="Co2Zn2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Zn2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Co2Zn2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Co2Zn2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Zn2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Co2Zn2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Zn2_top-A_\(d\).dat`"
echo $STR

STR="Co2Zn2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Co2Zn2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Zn2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Co2Zn2.pdos.out.pdos_atm#9\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#10\\(Co\\)*\(d\) Co2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Co2Zn2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Os2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Os2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Os2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Os2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Os2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Os2_top-A_\(d\).dat`"
echo $STR

STR="Zn2Os2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Os2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zn2Os2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Os2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Os2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Os2_top-B_\(d\).dat`"
echo $STR

STR="Zn2Os2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#11\\(Os\\)*\(d\) Zn2Os2.pdos.out.pdos_atm#12\\(Os\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Os2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Pd2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Pd2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Pd2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Pd2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#11\\(Pd\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Pd2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Pd2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Pd2.pdos.out.pdos_atm#12\\(Pd\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Pd2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Pt2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Pt2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Pt2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Pt2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#11\\(Pt\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Pt2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Pt2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Pt2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Pt2.pdos.out.pdos_atm#12\\(Pt\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Pt2_top-A_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Re2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="Zn2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Re2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Re2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Re2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Re2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Re2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Re2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Re2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Re2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Re2_top-B_\(d\).dat`"
echo $STR

STR="Zn2Re2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Re2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zn2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Re2_top-A_\(d\).dat`"
echo $STR

STR="Zn2Re2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#11\\(Re\\)*\(d\) Zn2Re2.pdos.out.pdos_atm#12\\(Re\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Re2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Rh2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Rh2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Rh2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Zn2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Rh2_top-A_\(d\).dat`"
echo $STR

STR="Zn2Rh2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Rh2_top-B_\(d\).dat`"
echo $STR

STR="Zn2Rh2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Rh2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Rh2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#12\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Rh2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Rh2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Rh2.pdos.out.pdos_atm#11\\(Rh\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Rh2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_bridge-A_A-A_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#11\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_bridge-A_B-B_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#12\\(Ta\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_top-A_\(d\).dat`"
echo $STR

STR="Zn2Ta2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ta2_top-B_\(d\).dat`"
echo $STR

sleep 10

STR="Ni2Zn2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Ni2Zn2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Zn2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Zn2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Ni2Zn2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#10\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Ni2Zn2.pdos.out.pdos_atm#9\\(Ni\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Ni2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Ni2Zn2_hollow-A_B_B-FCC_\(d\).dat`"
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

STR="Zn2W2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Zn2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2W2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2W2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Zn2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2W2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2W2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2W2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2W2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2W2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) Zn2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2W2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2W2_top-A_\(d\).dat`"
echo $STR

STR="Zn2W2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2W2.pdos.out.pdos_atm#11\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2W2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2W2.pdos.out.pdos_atm#12\\(W\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2W2_top-A_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Y2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Y2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Y2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zn2Y2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Y2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Y2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Y2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Zn2Y2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Y2_top-B_\(d\).dat`"
echo $STR

STR="Zn2Y2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#11\\(Y\\)*\(d\) Zn2Y2.pdos.out.pdos_atm#12\\(Y\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Y2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Zr2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Zr2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Zr2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Zr2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Zn2Zr2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Zr2_top-A_\(d\).dat`"
echo $STR

STR="Zn2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Zr2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zn2Zr2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#11\\(Zr\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Zr2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Zr2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Zr2.pdos.out.pdos_atm#12\\(Zr\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Zr2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ru2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Ru2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ru2_top-B_\(d\).dat`"
echo $STR

STR="Zn2Ru2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ru2_4fold-A_A_B_B_\(d\).dat`"
echo $STR

STR="Zn2Ru2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ru2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Ru2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#11\\(Ru\\)*\(d\) Zn2Ru2.pdos.out.pdos_atm#12\\(Ru\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Ru2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Au2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Au2_bridge-B_B-A_\(d\).dat`"
echo $STR

STR="Zn2Au2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Au2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Au2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Au2_bridge-A_B-A_\(d\).dat`"
echo $STR

STR="Zn2Au2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Au2_bridge-A_B-B_\(d\).dat`"
echo $STR

STR="Zn2Au2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Au2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Au2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#11\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Au2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Au2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Au2.pdos.out.pdos_atm#12\\(Au\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Au2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

sleep 10

STR="Zn2Nb2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Nb2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Nb2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Nb2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Nb2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Zn2Nb2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#11\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Nb2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Zn2Nb2.pdos.out.pdos_atm#9\\(Zn\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#10\\(Zn\\)*\(d\) Zn2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Nb2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Zn2Nb2.pdos.out.pdos_atm#12\\(Nb\\)*\(d\) "
STR="`sumpdos.x ${STR} > Zn2Nb2_top-A_\(d\).dat`"
echo $STR

sleep 10

STR="Mn2Zn2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_bridge-A_A-B_\(d\).dat`"
echo $STR

STR="Mn2Zn2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Zn2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_hollow-A_B_B-FCC_\(d\).dat`"
echo $STR

STR="Mn2Zn2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_top-A_\(d\).dat`"
echo $STR

STR="Mn2Zn2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_hollow-A_A_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Zn2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#11\\(Zn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_hollow-A_B_B-HCP_\(d\).dat`"
echo $STR

STR="Mn2Zn2.pdos.out.pdos_atm#9\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#10\\(Mn\\)*\(d\) Mn2Zn2.pdos.out.pdos_atm#12\\(Zn\\)*\(d\) "
STR="`sumpdos.x ${STR} > Mn2Zn2_hollow-A_A_B-FCC_\(d\).dat`"
echo $STR

sleep 10

