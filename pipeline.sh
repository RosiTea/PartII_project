snippy -cpus 16 -ref sequence.gb -R1 B9_1_fastq.gz -R2 B9_2_fastq.gz --fbopt '-p 1' --outdir ./test_20230207_1/
snippy --cpus 16 --ref sequence.gb --R1 B9_1_fastq.gz --R2 B9_2_fastq.gz --fbopt '-p 1' --outdir ./test_20230207_2/
snippy --cpus 16 --ref sequence.gbk --R1 B9_1_fastq.gz --R2 B9_2_fastq.gz --fbopt '-p 1' --outdir ./test_20230207_3/

# Downloaded full genebank file and replace sequence.gb
# Another test round on snippy call variant + alternative filter

snippy --cpus 16 --ref sequence.gbk --R1 B9_1_fastq.gz --R2 B9_2_fastq.gz --fbopt '-p 1' --outdir ../02.call_variants/final_test1
ll|grep 'test'|awk '{print $9}'>raw_vcf.lst
chmod +x re_filter_raw_vcf.sh

# I put raw_vcf.lst and re_filter_raw_vcf.sh in 'scripts' folder, final_test1 in 'result' folder;  both folders are under 
'02.call_variants'

cd scripts
./re_filter_raw_vcf.sh

# I tried to see how many variants
grep -v -c '^#' snps.vcf


# Official run from raw data to call_variant
wf
cd 01.filter/scripts
chmod +x bulk_filter.sh
conda activate fastp
./bulk_filter.sh
conda deactivate
conda activate snippy
wf
cd 02.call_variants/scripts
chmod +x bulk_call_variants.sh
./bulk_call_variants.sh
ll|grep 'variant'|awk '{print $9}'> ../scripts/raw_vcf.lst
./re_filter_raw_vcf.sh

