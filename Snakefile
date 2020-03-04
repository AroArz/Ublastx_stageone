# vim: syntax=python expandtab tabstop=4
# ARGs-OAP version 2
# Aron Arzoomand 2/3 2020

SAMPLES = glob_wildcards("input/{sample}_1.fq").sample
print(SAMPLES)


rule all:
    input: "example/testout/extracted.fa",


rule Stage_one:
    input:
        Read_Directory="example/inputfqs",
    output:
        "example/testout/extracted.fa",
    shell:
        """
        ./argoap_pipeline_stageone_version2 -i {input.Read_Directory} -o example/testout -m example/meta-data.txt
        """
        
