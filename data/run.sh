#! /usr/bin/env bash

bowtie2 -x hg19.chr1 -U factorx.chr1.fq.gz\
    | samtools sort > factorx.bam

bedtools genomecov -ibam factorx.bam -bg > factorx.bg

bedGraphToBigWig factorx.bg hg19.chrom.sizes factorx.bw

macs2 callpeak -t factorx.bam --nomodel

#after this, I made 100bp wide peaks using the summits and slop, 
#and then ran the code in the included screenshot and it took ~48
#hours to finish so I did not include it as part of the run file.  After
#literally two days of waiting it finally spit out a huge mess of stuff
#that included the numeric probability matrix, which I put into TOMTOM and
#got two CTCF matches as the top two hits (second included screenshot)
