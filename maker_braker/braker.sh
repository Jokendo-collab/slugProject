#! /bin/sh

###############
##HEADER FOR BIOWULF SBATCH SUBMIT
##############

#SBATCH --job-name=bkr_annot
#SBATCH -N 1
#SBATCH -n 32
#SBATCH --partition=norm
#SBATCH --mail-type=FAIL,END
#SBATCH --mem=100G
#SBATCH --gres=lscratch:400
#SBATCH --time=240:00:00
#SBATCH --mail-user=javan.okendo@nih.gov

#######
## ACTIVATE mamba ENVIRONMENT
#######

#move to the dir containing bam files

source /data/$USER/conda/etc/profile.d/conda.sh && source /data/$USER/conda/etc/profile.d/mamba.sh

mamba activate BRAKER

export GENEMARK_PATH=/home/okendojo/software/geneMark/gmes_linux_64
#export AUGUSTUS_BIN_PATH=/home/okendojo/software/config

#export AUGUSTUS_BIN_PATH=/data/okendojo/conda/envs/BRAKER/bin/


########
## DEFINE FILES AND FILE LOCATIONS
########

## number of cores to use; set THREADS to a multiple of 4; should match SBATCH
## max memory to use; should match SBATCH
THREADS=32
MEM=100G



##HOME_DIR is where you will direct outputs

HOME_DIR="/data/okendojo/slugProject/rnaseq/bamFiles"

##GENOME is the source of the genome FASTA

GENOME="/data/okendojo/slugProject/annot/softmaskedgenome/assemblySoftMasked.fasta"
PROSEQ="/data/okendojo/slugProject/proteinDB/uniprot_invertebrate.fasta"
PROHINT_PATH="/home/okendojo/software/ProtHint/bin"
## Transcripts aligned to genome in BAM format

TRANSCRIPT_BAM="sample_10.bam,sample_2.bam,sample_4.bam,sample_6.bam,sample_8.bam,sample_1.bam,sample_3.bam,sample_5.bam,sample_7.bam,sample_9.bam"

##SPECIES_NAME should be the name you want the project files to be under

SPECIES_NAME="gastropoda"
	
#############
## script commands below
#############

cd ${HOME_DIR}



## BRAKER
## Running the first round of braker with 


echo "----- beginning braker  at" `date`

braker.pl --cores=$THREADS --verbosity=2 --species=$SPECIES_NAME --genome=$GENOME --PROTHINT_PATH=${PROHINT_PATH} --prot_seq=${PROSEQ} --etpmode --cores 48 --bam=$TRANSCRIPT_BAM --BAMTOOLS_PATH=/data/okendojo/conda/envs/BRAKER/bin/ --softmasking --useexisting --UTR=on

echo "----- finished braker at" `date`

