# mac中安装biopython

## 安装brew
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## 安装pypy
```
brew install pypy3
```

## 安装jython
```
brew install jython
```
## 安装biopython
1. 下载[get_pip.py](https://github.com/anpengapple/pypy_get_pip)
2. 安装pip并安装biopython
```
pypy3 get_pip.py  #在下载get_pip.py的文件夹
pypy3 -m pip install biopython 
```
