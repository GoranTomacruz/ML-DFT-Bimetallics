#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=ECUT-950##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022Apr05files.10.out     ##CHANGE
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
module load qe/6.6_openmpi-4.0.3

ulimit -s unlimited

export OMP_NUM_THREADS=1

##cd to working directory
mpirun -np 37 pw.x -i Ag-950.in > Ag-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Au-950.in > Au-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cd-950.in > Cd-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cr-950.in > Cr-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cu-950.in > Cu-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Hf-950.in > Hf-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Hg-950.in > Hg-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ir-950.in > Ir-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i La-950.in > La-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Mo-950.in > Mo-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Nb-950.in > Nb-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Os-950.in > Os-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Pd-950.in > Pd-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Pt-950.in > Pt-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Re-950.in > Re-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Rh-950.in > Rh-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ru-950.in > Ru-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Sc-950.in > Sc-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ta-950.in > Ta-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Tc-950.in > Tc-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ti-950.in > Ti-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i V-950.in > V-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i W-950.in > W-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Y-950.in > Y-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Zn-950.in > Zn-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Zr-950.in > Zr-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Co-950.in > Co-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Mn-950.in > Mn-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Fe-950.in > Fe-950.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ni-950.in > Ni-950.out   ##   mpirun -np XX pw.x -i input_file > output_file
