# ubuntu 18.04.2安装R及Rstudio
[参考1](https://blog.csdn.net/FontThrone/article/details/80413685)
[参考2](https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu/README.html)
## 设置下载镜像，提高下载速度
```
cd /etc/apt/sources.list.d
sudo apt-get install vim  #Ubuntu18.04.2初始安装的vim不完整，用该语句安装完整版本vim
sudo vim R.list
```
按“i”键进入插入编辑模式 \
输入deb https://mirrors.tuna.tsinghua.edu.cn/CRAN/bin/linux/ubuntu bionic-cran35/ \
按ese退出编辑模式 \
按 :wq! 保存并退出 \
**关于Ubuntu系统版本的说明：**\
Ubuntu18.×是 bionic \
Ubuntu16.×是 xenial \
在命令行输入以下代码查看系统版本名称（Codename）
```
lsb_release -a
```
## 下载公钥
```
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
```
## 安装R
```
sudo apt-get update
sudo apt-get install r-base r-base-dev
```
## 安装Rstudio
官网下载Rstudio包:[https://www.rstudio.com/products/rstudio/download/#download](https://www.rstudio.com/products/rstudio/download/#download) 
```
cd Rstudio下载文件夹
sudo apt-get install gdebi-core #可能会报错，用下面语句修复
sudo apt --fix-broken install #修复上面报错
```
两种方法安装Rstudio的deb包
```
sudo dpkg -i rstudio-xenial-1.1.463-amd64.deb
```
```
sudo apt-get install gdebi-core
sudo gdebi -n rstudio-xenial-1.1.463-amd64.deb
```
