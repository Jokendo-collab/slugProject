#!/bin/bash
#SBATCH --partition=norm
#SBATCH --mem=120g
#SBATCH --ntasks=32
#SBATCH --constraint=x2650
#SBATCH --exclusive
#SBATCH --gres=lscratch:200
#SBATCH --time=170:00:00
#SBATCH --mail-type=FAIL,END

#Load the required module
module load repeatmodeler

cd /data/okendojo/slugProject/annot

RepeatModeler -pa 32 -engine ncbi -database deroceras

