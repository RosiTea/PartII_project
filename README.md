# PartII_project
Part II project (Natural Sciences undergrad) under Department of Biochemistry, University of Cambridge; Supervised by Rui Guan and Kiran Patil

The pipeline runs in the following steps. Some shell scripts were written to run all samples in bulk. 

00.data
Raw sequencing data of parental strains, chemical-evolved strains, and water-control strains.

01.filter
Use fastq to filter raw data
See more https://github.com/OpenGene/fastp

02.call_variants
Install and test snippy and breseq to call variants.
Modified the snippy package by diverting towards re_filter_raw_vcf.sh, for project-specific usage.

03.data_analysis
Data handled using R.
