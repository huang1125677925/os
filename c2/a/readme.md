# 主要内容

编译一个主引导记录，写到磁盘的第一个扇区，然后用bochs启动，显示字符串1 MBR

# 操作步骤

1、使用bximage 工具创建一个磁盘



![截屏2020-12-07 下午11.33.42](/Users/huangchuang/Library/Application Support/typora-user-images/截屏2020-12-07 下午11.33.42.png)

![截屏2020-12-07 下午11.34.26](/Users/huangchuang/Library/Application Support/typora-user-images/截屏2020-12-07 下午11.34.26.png)

然后回车，disk就创建出来了

![截屏2020-12-07 下午11.34.59](/Users/huangchuang/Library/Application Support/typora-user-images/截屏2020-12-07 下午11.34.59.png)



把上图中的ata0这一行写到bochsrc文件中，当然了这个我们已经写过了



2、执行mbr,sh文件

3、执行bochs -f bochsrc, 结果如下

![截屏2020-12-07 下午11.36.32](/Users/huangchuang/Library/Application Support/typora-user-images/截屏2020-12-07 下午11.36.32.png)

回车，如下

![截屏2020-12-07 下午11.36.54](/Users/huangchuang/Library/Application Support/typora-user-images/截屏2020-12-07 下午11.36.54.png)



结果如下

![截屏2020-12-07 下午11.37.09](/Users/huangchuang/Library/Application Support/typora-user-images/截屏2020-12-07 下午11.37.09.png)

本章结束