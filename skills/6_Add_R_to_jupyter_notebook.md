# 在jupyter nootbook中添加R核
[参考1](https://blog.csdn.net/u012180351/article/details/80572382)\
[参考2](https://www.cnblogs.com/zongfa/p/8540666.html)
**[参考2比较坑]**
* 在某些网站上复制相同的东西至终端，会有不同的效果，例如在参考2中直接复制sudo apt-get install libzmq3-dev libssl-dev libcurl​4-openssl-dev，实际上在4前多了一个红色的​ ，但是在终端并不显示（在这里也无法显示,打开本文档源码可以显示)，务必在参考1中进行复制代码
* 不要sudo R，这样在最后作用于jupyter时会失败
## 完整流程

```
#安装必要的lib
sudo apt install git
sudo apt-get install libzmq3-dev libssl-dev libcurl4-openssl-dev

#进入R环境
R

#在R中安装包
> install.packages(c('crayon', 'pbdZMQ', 'devtools'))
> devtools::install_github(paste0('IRkernel/', c('repr', 'IRdisplay', 'IRkernel')))  #失败的话多重复几次

#使内核可用于Jupyter
> IRkernel::installspec()
```
最终将R核安装在当前用户下（Installed kernelspec ir in /home/xiaochang/.local/share/jupyter/kernels/ir）
