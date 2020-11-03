# 问题：Ubuntu18.04LTS中Rstudio无法输入中文
# 解决办法：
* 得到依赖包
```
wget http://ikuya.info/tmp/fcitx-qt5-rstudio-qt542.tar.gz
tar xf fcitx-qt5-rstudio-qt542.tar.gz
sudo apt install ./fcitx-frontend-qt5-rstudio_1.0.5-1ubuntu1~qt542_amd64.deb ./libfcitx-qt5-1-rstudio_1.0.5-1ubuntu1~qt542_amd64.deb #可能会报错，不用担心，继续执行
```
* 解压
```
dpkg-deb -R fcitx-frontend-qt5-rstudio_1.0.5-1ubuntu1~qt542_amd64.deb fcitx-frontend-qt5-rstudio
dpkg-deb -R libfcitx-qt5-1-rstudio_1.0.5-1ubuntu1~qt542_amd64.deb libfcitx-qt5-1-rstudio
```
* 复制至rstudio指定目录
```
sudo cp -r fcitx-frontend-qt5-rstudio/usr/lib/rstudio/bin /usr/lib/rstudio
sudo cp -r libfcitx-qt5-1-rstudio/usr/lib/rstudio/bin /usr/lib/rstudio
```
* 删除无用包
```
rm -r fcitx-qt5-1.0.5 fcitx-frontend-qt5-rstudio libfcitx-qt5-1-rstudio
rm fcitx-frontend-qt5-rstudio_1.0.5-1ubuntu1~qt542_amd64.deb fcitx-qt5-rstudio-qt542.tar.gz libfcitx-qt5-1-rstudio_1.0.5-1ubuntu1~qt542_amd64.deb
```
* 参考：
[链接1](https://blog.csdn.net/matteoshenl/article/details/78603528)
[链接2](https://wiki.deepin.org/wiki/%E6%90%9C%E7%8B%97%E8%BE%93%E5%85%A5%E6%B3%95%E5%9C%A8RStudio%E4%B8%8B%E6%97%A0%E6%B3%95%E5%88%87%E6%8D%A2%E7%9A%84%E8%A7%A3%E5%86%B3%E5%8A%9E%E6%B3%95#.E6.AD.A3.E6.96.87)
