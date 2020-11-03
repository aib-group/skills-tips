# 工作站中装ubuntu18.04.2与windows10 1809双系统
参考：[https://blog.csdn.net/lnfxbianxiu/article/details/80394284](https://blog.csdn.net/lnfxbianxiu/article/details/80394284)
## 注意事项
1. 采用UEFI+GPT模式 \
bios是指基本输入/输出系统（用于引导系统），开机后在出现厂家商标符号时按F2（不同电脑不一样），在boot栏可选择不同的启动方式\
UEFI是进入bios之后的可选的启动方式（有的主板可能不支持），制作启动U盘时注意选择该方式\
GPT是UEFI引导下的磁盘分区格式，另一个名字叫做GUID分区表格式，需要将磁盘设置为GPT格式才能正常启动
2. 启动时，直接选择 UEFI USB …… 为第一启动可能会报错，应选择主板自带的 UEFI …… 为第一启动方式， UEFI USB …… 放在第二即可
3. 一定要先装windows，再装ubuntu，这样默认ubuntu启动，并自动生成可选择启动系统的界面，否则需要在windows上安装EaseBCD软件
4. 制作启动U盘工具推荐Rufus(在windows上装)，可以制作windows，linux多种系统的启动U盘
