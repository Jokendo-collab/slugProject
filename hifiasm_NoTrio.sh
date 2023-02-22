#!/bin/bash
#SBATCH --partition=largemem
#SBATCH --cpus-per-task=32
#SBATCH --mem=512g
#SBATCH --ntasks-per-core=1
#SBATCH --time=170:00:00
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=javan.okendo@nih.gov
#SBATCH --job-name=hifiNoTrio



#Move to the directory where the results will be written
cd /data/okendojo/slugProject/assembly/hifiasm/notrio

hifiasm -o hifiasmNoTrio.asm -t 32 -D 10.0 -c 25 -d 75 --hg-size 1.9g -l1 /data/okendojo/slugProject/hifi/derLae_hifi.fq.gz 


