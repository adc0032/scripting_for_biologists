#!/bin/bash

####BWA Script
##Used for mapping reads to reference (guided assembly)
##Created: 1/18/19 By: ADC
##Last Modified:
####

###Modules and Variables
source /opt/asn/etc/asn-bash-profiles-special/modules.sh
module load bwa/0.7.12

R1="/path/to/read1.fq" #read1 -FASTQ of forward raw reads
R2="/path/to/read2.fq" #read2 -FASTQ of reverse raw reads
Ref="/path/to/reference.fa" #mapping reference genome FASTA

###BWA Commands

#create index of reference genome using BWT-SW algorithm (-a); -p user provided index database name

bwa index -p RefName -a bwtsw {$Ref} ;

#mapping raw reads to indexed reference genome; use name created in 'bwa index' command for reference
##-M for picard compatibility; -R for readgroup assignment for GATK; -v2 for printing warnings and errors to stdout or error file##

bwa mem -M -R "@RG\tID:species_name\tLB:lib\tPL:ILLUMINA\tSM:species_name" -v 2 RefName {$R1} {$R2} > species.ref.sam
