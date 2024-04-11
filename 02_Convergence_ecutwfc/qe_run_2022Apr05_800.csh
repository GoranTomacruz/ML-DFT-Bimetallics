#!/bin/bash
#SBATCH --partition=batch --qos=240c-1h_batch
#SBATCH --job-name=ECUT-800##CHANGE
#SBATCH --nodes=1         ##CHANGE
#SBATCH --ntasks-per-node=37           ##CHANGE
#SBATCH --mem-per-cpu=4G
#SBATCH --out=2022Apr05files.7.out     ##CHANGE
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
mpirun -np 37 pw.x -i Ag-800.in > Ag-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Au-800.in > Au-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cd-800.in > Cd-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cr-800.in > Cr-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Cu-800.in > Cu-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Hf-800.in > Hf-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Hg-800.in > Hg-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ir-800.in > Ir-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i La-800.in > La-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Mo-800.in > Mo-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Nb-800.in > Nb-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Os-800.in > Os-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Pd-800.in > Pd-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Pt-800.in > Pt-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Re-800.in > Re-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Rh-800.in > Rh-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ru-800.in > Ru-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Sc-800.in > Sc-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ta-800.in > Ta-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Tc-800.in > Tc-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ti-800.in > Ti-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i V-800.in > V-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i W-800.in > W-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Y-800.in > Y-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Zn-800.in > Zn-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Zr-800.in > Zr-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Co-800.in > Co-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Mn-800.in > Mn-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Fe-800.in > Fe-800.out  && ##   mpirun -np XX pw.x -i input_file > output_file
mpirun -np 37 pw.x -i Ni-800.in > Ni-800.out   ##   mpirun -np XX pw.x -i input_file > output_file
