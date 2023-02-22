#!/bin/bash
#SBATCH --partition=norm
#SBATCH --mem=120g
#SBATCH --ntasks=32
#SBATCH --constraint=x2650
#SBATCH --exclusive
#SBATCH --gres=lscratch:200
#SBATCH --time=170:00:00
#SBATCH --mail-type=FAIL,END

#Load the module
module load repeatmasker

#move to the working dir
cd /data/okendojo/slugProject/annot

RepeatMasker -pa 32 -e ncbi -noint -xsmall -species gastropods -dir maskRep assembly.fasta 

