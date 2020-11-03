dir_raw=/media/zx/HDD2/cooperation/chenjieping/bulk/data/Lnc
refdata=/media/zx/HDD2/genome/human/hisat2

file=$1
echo "\n####################开始处理${file}数据####################\n"
##########1.质控
echo "\n##########开始第一次质控${file}数据##########\n"
date +"%Y-%m-%d %H:%M:%S"
fastqc ${dir_raw}/${file}_good_1.fq.gz -o ./1_fastqc -t 5
fastqc ${dir_raw}/${file}_good_2.fq.gz -o ./1_fastqc -t 5
##########2.比对
echo "\n##########开始比对${file}数据##########\n"
date +"%Y-%m-%d %H:%M:%S"
echo "生成sam文件……" 
hisat2 -t -x ${refdata}/hg38/genome -1 ${dir_raw}/${file}_good_1.fq.gz -2 ${dir_raw}/${file}_good_2.fq.gz -S ./4_align/bam/${file}.sam
date +"%Y-%m-%d %H:%M:%S"
echo "转换成bam文件……"
samtools view -S ./4_align/bam/${file}.sam -b > ./4_align/bam/${file}.bam 
date +"%Y-%m-%d %H:%M:%S"
echo "生成排序的sorted.bam文件……"
samtools sort ./4_align/bam/${file}.bam -o ./4_align/bam/${file}_sorted.bam
date +"%Y-%m-%d %H:%M:%S"
echo "生成索引的sorted.bam文件……"
samtools index ./4_align/bam/${file}_sorted.bam
#date +"%Y-%m-%d %H:%M:%S" 
#echo "删除sam,bam中间临时文件……"
#rm ./4_align/bam/${file}.sam
#rm ./4_align/bam/${file}.bam
date +"%Y-%m-%d %H:%M:%S"
echo "进行count计数……"
htseq-count -r pos -f bam ./4_align/bam/${file}_sorted.bam ${refdata}/gencode.v32.chr_patch_hapl_scaff.annotation.gtf > ./4_align/count/${file}.count
##########3.比对质控
date +"%Y-%m-%d %H:%M:%S"
#echo "进行比对质控……"
#qualimap bamqc --java-mem-size=10G -nt 8 -bam $file -gff ${refdata}/gencode.vM23.chr_patch_hapl_scaff.annotation.gtf -outdir ./5_qualimap/bamqc/$file -outformat PDF:HTML
#date +"%Y-%m-%d %H:%M:%S"
echo "${file}样本比表达谱生成完毕！\n\n"
