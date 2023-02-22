#!/bin/bash
#SBATCH --partition=norm
#SBATCH --cpus-per-task=32
#SBATCH --mem=232g
#SBATCH --ntasks-per-core=1
#SBATCH --time=96:00:00
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=javanokendo@gmail.com

# Load the module
module load jellyfish/2.3.0

#change to the directory containing the data
cd /data/okendojo/slugProject/jellyfish

#run jellyfish
jellyfish count -C -m 21 -s 2000M --min-quality=20 --quality-start=33 -t 32  <(zcat mat_R1.fq.gz  mat_R2.fq.gz  pat_R1.fq.gz  pat_R2.fq.gz)  -o illumina.jf

#Export the kmer count histogram
jellyfish histo -t 32 illumina.jf > illumina.histo
