#!/bin/bash
#SBATCH --partition=norm
#SBATCH --mem=120g
#SBATCH --ntasks=32
#SBATCH --constraint=x2650
#SBATCH --exclusive
#SBATCH --gres=lscratch:200
#SBATCH --time=10:00:00
#SBATCH --mail-type=FAIL,END

module load STAR

cd /data/okendojo/slugProject/annot/genomeIndex

fasta="/data/okendojo/slugProject/annot/softmaskedgenome/assemblySoftMasked.fasta"

STAR --runThreadN 24 --genomeSAindexNbases 13 --runMode genomeGenerate --genomeDir index_masked --genomeFastaFiles $fasta

