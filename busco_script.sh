#!/bin/bash

####BUSCO Script
##Used for assessing genome quality by determining presence and state of a set of benchmarking single copy orthologs in a genome or annotation
##Created: 1/18/19 By: ADC
##Last Modified:
####

###Modules and Variables
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load anaconda/3-4.2.0_cent

Seq="/path/to/genome.fa" #FASTA for genome of interest
WD="/path/to/workingdirectory" #working directory for BUSCO

###BUSCO_SETUP Commands
cd {$WD}

#copying Augustus config directory to run BUSCO into a directory named "augustus" in $WD
mkdir augustus
cd augustus
cp -r /opt/asn/apps/anaconda_3-4.2.0_cent/pkgs/augustus-3.2.3-boost1.60_0/config .

cp /opt/asn/apps/anaconda_3-4.2.0_cent/busco/config.ini.default ./config.ini ;

#Directing busco to the appropriate configs

export BUSCO_CONFIG_FILE="/path/to/augustus/config.ini"

export AUGUSTUS_CONFIG_PATH="/home/MYNAME/augustus/config"

###Executing_BUSCO

#going back to the working directory
cd ../

#runs BUSCO assesment on supplied genome
## -l lineage database-if not a default (eukarya, prokarya, etc.) you must download and supply path
## -m specifies genome mode; -sp Identifies species for augustus training, each database has a default (ex. eukarya database is human)

python /path/to/run_BUSCO.py -i {$Seq} -o OUTPUT_NAME -l LINEAGE_DATABASE -m geno -sp SPECIES_FOR_TRAINING
