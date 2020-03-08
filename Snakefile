# vim: syntax=python expandtab tabstop=4
# ARGs-OAP version 2
# Aron Arzoomand 2/3 2020

SAMPLES = glob_wildcards("input/{sample}_1.fq").sample
print(SAMPLES)


rule all:
    input: "output/extracted.fa",


rule Stage_one:
    input:
        Read_Directory="input",
    output:
        "output/extracted.fa",
    threads:
        cluster_config["Stage_one"]["n"] if "Stage_one" in cluster_config else 8
    shell:
        """
        ./argoap_pipeline_stageone_version2 \
        -i {input.Read_Directory} \
        -o output \
        -m meta-data.txt \
        -s \
        -n {threads}
        """
        
