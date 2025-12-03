# Paper_9_SethnaZ: RNA neoantigen vaccines prime long-lived CD8+ T cells in pancreatic cancer
Sethna, Z,, Guasp, P,, Reiche, C, et al, RNA neoantigen vaccines prime long-lived CD8+ T cells in pancreatic cancer, Nature 639, 1042–1051 (2025), https://doi.org/10.1038/s41586-024-08508-4

## Data Availability
All single-cell sequencing data are available at the Gene Expression Omnibus under accession number GSE222011. All experimental source data are provided. Per institutional data sharing policies, requests for deidentified individual participant data can be made beginning 12 months after publication and for up to 36 months post-publication. Deidentified individual participant data reported in the manuscript will be shared under the terms of a Data Use Agreement that addresses the privacy and security requirements for safeguarding the data under HIPAA and MSK policies, and may only be used for approved proposals. Requests may be made to the corresponding author. Source data are provided with this paper.

## Code availability
Code for CloneTrack is available at https://github.com/zsethna/CloneTrack. Code for PhenoTrack is available at https://github.com/zsethna/PhenoTrack. Code to identify GLIPH2 metaclones is available at http://50.255.35.37:8080/tools.


# Versions
Whole exome sequencing, mutation identification, and phylogeny - we aligned reads to the reference human genome (hg19) using BWA (v0.7.17), and marked duplicates by picard-2.11.0 MarkDuplicates. Then, we performed indel realignment by the Genome Analysis toolkit
(GenomeAnalysisTK-3.8-1)44 using RealignerTargetCreator and IndelRealigner. We used the 1000 genome phase1 indel (1000G_phase1.indels.b37.vcf) and Mills indel calls (Mills_and_1000G_gold_standard.indels.b37.vcf) as references. We then calibrated base
quality by the GATK's BaseRecalibrator using dbSNP version 138 as reference source. After a pre-processing step, we employed MuTect 1.1.745 and Strelka 1.0.1546 to identify SNVs and indels in tumor samples compared to normal. Using bam-readcounts (v0.8). We used
phyloWGS (v1.0-rc2) to reconstruct the phylogeny tree and also to infer CCF on the merged set of mutations. We visualized trees with R package data.tree (v1.1.0).

|Software|Version|
|:--|:--:|
|Python | v3.11.6|
