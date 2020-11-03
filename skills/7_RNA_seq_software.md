# Ubuntu18.04.2上RNA seq软件安装
* 时间：2019.4.6 
* [参考][https://www.plob.org/article/11457.html](https://www.plob.org/article/11457.html) 
* 有的软件可能有新版本，实际安装时可以先百度搜索软件，查看新版本，这些软件安装包已保存至 ~/src 下
## home下创建两个文件夹
* biosoft 用于安装软件目录
* src 用于存放安装包
## 安装scatookit
* 功能： 下载，操作，验证NCBI SRA中二代测序数据
* 网址：[https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=software)
```
cd src
wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.9.4-2/sratoolkit.2.9.4-2-ubuntu64.tar.gz
tar -zxvf sratoolkit.2.9.4-2-ubuntu64.tar.gz
mv sratoolkit.2.9.4-2-ubuntu64 ~/biosoft
# 加入环境变量
echo 'PATH=$PATH:~/biosoft/sratoolkit.2.9.4-2-ubuntu64/bin' >> ~/.bashrc
# **更新路径** 这是与参考不一致的地方，或者关闭终端再打开下面的测试才正常
source ~/.bashrc
# 测试
prefetch -v
# 尝试下载，默认存放在家目录下的ncbi文件夹中
prefetch -c SRR390728
```
阅读官方文章进一步了解：
1. 如何开启ascp加速下载
2. vdb-config更改基本设置

## 安装fastqc
* 功能： 可视化展示二代测序数据质量
* 网站：[http://www.bioinformatics.babraham.ac.uk/projects/fastqc/](http://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
```
# 判断系统是否安装java
java -version
# 安装java
sudo apt install default-jre
# 验证
java -version
# 安装fastqc
cd src
wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip
unzip fastqc_v0.11.8.zip
mv FastQC/ ~/biosoft/
cd ~/biosoft/FastQC/
chmod 770 fastqc
# 添加环境变量， 我用sed修改
sed -i '/^PATH/s/\(.*\)/\1:~\/biosoft\/FastQC\//' ~/.bashrc
source ~/.bashrc
fastqc -v
# FastQC v0.11.8
```
拓展：
1. 了解fastqc结果中各个图的含义
2. 掌握如何从fastqc的结果中提取数据
3. 学习sed的用法，[http://dongweiming.github.io/sed_and_awk/](http://dongweiming.github.io/sed_and_awk/)

## 安装samtools
* SAM: 存放高通量测序比对结果的标准格式
* 功能： Reading/writing/editing/indexing/viewing SAM/BAM/CRAM format
* 网站: [http://samtools.sourceforge.net/](http://samtools.sourceforge.net/)
```
cd src
#  prerequsite
## system requirement 可能系统已经安装了
sudo apt install autoconf libz-dev libbz2-dev liblzma-dev libssl-dev

### zlib2
wget http://zlib.net/zlib-1.2.11.tar.gz
tar -zxvf zlib-1.2.11.tar.gz && cd zlib-1.2.11 && ./configure && make && sudo make install && cd .. && rm -rf zlib-1.2.11

### bzip2 **系统已经安装了，可能会报错，直接跳过这一步**
wget http://bzip.org/1.0.6/bzip2-1.0.6.tar.gz
tar -zxvf bzip2-1.0.6.tar.gz && cd bzip2-1.0.6 && ./configure && make && sudo make install && cd .. && rm -rf  bzip2-1.0.6

### curses **系统已经安装,直接跳过这一步**
sudo apt-get install libncurses5-dev 

### htslib **参考中不完全**
cd ~/biosoft
git clone https://github.com/samtools/htslib.git
cd htslib
autoheader
autoconf
./configure
make
sudo make install

# building samtools 最终安装在了 /usr/local/bin
cd ~/biosoft
git clone https://github.com/samtools/samtools.git
cd samtools
autoheader
autoconf -Wno-syntax
./configure 
make 
sudo make install

samtools --help

```
参考[https://blog.csdn.net/xubo245/article/details/50835347](https://blog.csdn.net/xubo245/article/details/50835347)

## 安装bcftools 
```
# building bcftools 最终安装在了 /usr/local/bin
cd ~/biosoft
git clone git://github.com/samtools/bcftools.git
cd bcftools 
autoheader && autoconf && ./configure
make 
sudo make install

bcftools --help

# 更新 bcftools
cd ~/biosoft/htslib; git pull
cd ../bcftools; git pull
make clean
make
sudo make install
```
参考：[http://samtools.github.io/bcftools/](http://samtools.github.io/bcftools/)

## 安装 HISAT2
* 功能： 将测序结果比对到参考基因组上
* 网站： [http://ccb.jhu.edu/software/hisat2/index.shtml](http://ccb.jhu.edu/software/hisat2/index.shtml)
* 可以下载源码包和二进制包，由于源码包还需要编译，速度比较慢还容易出错，编译出来的文件不完整，推荐直接下载二进制包 [https://blog.csdn.net/aosica321/article/details/51375969](https://blog.csdn.net/aosica321/article/details/51375969)
```
# 安装源码包

cd src
wget ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.1.0-source.zip
unzip hisat2-2.1.0-source.zip
# 编译hisat2
cd hisat2-2.1.0
make
rm -f *.h *.cpp 
cd ../
mv hisat2-2.1.0 ~/biosoft/hisat2
# add to PATH
sed  '/^PATH/s/\(.*\)/\1:~\/biosoft\/hisat2/' ~/.bashrc -i
source ~/.bashrc
# test
hisat2 -h

# 安装二进制包（推荐）
cd src
wget http://ccb.jhu.edu/software/hisat2/dl/hisat2-2.1.0-Linux_x86_64.zip
unzip hisat2-2.1.0-Linux_x86_64.zip
mv hisat2-2.1.0 ~/biosoft/hisat2
# add to PATH
sed  '/^PATH/s/\(.*\)/\1:~\/biosoft\/hisat2/' ~/.bashrc -i
source ~/.bashrc
# test
hisat2 -h
```
拓展：
* HISAT2支持--sra-acc <SRA accession number>,也就是可以集成SRATOOLS的，但是需要安装额外包，可以看文章自己折腾。

## 安装 HTSeq
* 功能： 根据比对结果统计基因count
```
# 默认已经安装好了python
pip install htseq
## 验证
python
>>> import HTSeq
```
