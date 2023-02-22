#!/bin/bash
#SBATCH --partition=norm
#SBATCH --mem=120g
#SBATCH --ntasks=32
#SBATCH --constraint=x2650
#SBATCH --exclusive
#SBATCH --gres=lscratch:200
#SBATCH --time=24:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --job-name=Alignment

##==============================================
##Load the star module
##==============================================
module load STAR

#move to the directory containing the raw files

cd /data/okendojo/slugProject/rnaseq

#loop over the base files and run the star on the paired-end reads.


echo "-----the analysis is beginning" `date`

# define variables
index=/data/okendojo/slugProject/annot/genomeIndex/index/

# get our data files
FQ_DIR=/data/okendojo/slugProject/rnaseq


for base in 6543-Dc1-HiSeqTranscript_S6 6543-Dc2-HiSeqTranscript_S7 6543-Dc3-HiSeqTranscript_S8 6543-Dc4-HiSeqTranscript_S9 6543-Dc6-HiSeqTranscript_S10 6543-Di1-HiSeqTranscript_S1 6543-Di4-HiSeqTranscript_S2 6543-Di5-HiSeqTranscript_S3 6543-Di6-HiSeqTranscript_S4 6543-Di7-HiSeqTranscript_S5
do
  echo $base

  # define R1 fastq filename
  fq1=$FQ_DIR/${base}_R1_001.fastq.gz	

 # define R2 fastq filename
  fq2=$FQ_DIR/${base}_R2_001.fastq.gz

 # align with STAR
STAR --runThreadN 32 --genomeDir $index --readFilesIn $fq1 $fq2 --outSAMtype BAM   SortedByCoordinate --readFilesCommand zcat --outFileNamePrefix $base"_"

done

echo "The analysis is done! on" `date`


