#!/bin/bash

cat raw_vcf.lst |while read file;
do
    cd ../snippy_results_0305/$file

    echo "$file" >> ../num_of_var_para_test.txt
    grep -v -c '^#' snps.vcf >> ../num_of_var_para_test.txt

    cd ../../scripts/
done
