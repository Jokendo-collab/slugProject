#!/bin/bash
#SBATCH --partition=norm
#SBATCH --mem=120g
#SBATCH --ntasks=32
#SBATCH --constraint=x2650
#SBATCH --exclusive
#SBATCH --gres=lscratch:200
#SBATCH --time=170:00:00
#SBATCH --mail-type=FAIL,END

#load the module
module load augustus

cd /data/okendojo/slugProject/annot

augustus --progress=true --UTR=on  --alternatives-from-sampling=true --softmasking=1 --species=gastropods assembly.fasta
