# 服务器
```
ssh node5
jupyter notebook --no-browser --port=8014 --ip=127.0.0.1
```
# 客户端
```
ssh -t -t zhangxiaochang@192.168.172.210 -L 8014:localhost:8014 ssh node5 -L 8014:127.0.0.1:8014
```
