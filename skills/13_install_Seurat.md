# 安装R包Seurat遇到的坑
## curl失败
sudo apt-get install libcurl4-gnutls-dev

## openssl失败
sudo apt-get install libssl-dev




## RcppTOML失败(方法一：有时不好使)
### 下载https://github.com/eddelbuettel/rcpptoml
### open project
### install and restart

## RcppTOML失败(方法二：好使)
### library(devtools)
### install_version(package = "RcppTOML",version = "0.0.4")
