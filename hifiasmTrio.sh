#!/bin/bash
#SBATCH --partition=largemem
#SBATCH --cpus-per-task=32
#SBATCH --mem=512g
#SBATCH --ntasks-per-core=1
#SBATCH --time=170:00:00
#SBATCH --mail-type=BEGIN,FAIL,END
#SBATCH --mail-user=javan.okendo@nih.gov
#SBATCH --job-name=hifiTrio


# Trio binning assembly
cd /data/okendojo/slugProject/assembly/hifiasm/trio

matyak=/data/okendojo/slugProject/yaks/mat.yak
patyak=/data/okendojo/slugProject/yaks/pat.yak

hifiasm -o hifiasmTrio.asm -t 32  -D 10.0 -c 25 -d 75 --hg-size 1.9g -1 ${patyak} -2 ${matyak} /data/okendojo/slugProject/hifi/derLae_hifi.fq.gz 

