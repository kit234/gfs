# gfs
# 说明(CN)
gfs(get from source)是一个bash脚本,用来帮助从源码编译软件  
gfs包括gfs和gfs-tool两个脚本,gfs脚本主要通过调用gfs_SH目录下的脚本
来执行软件源码的下载、编译、安装等过程
gfs-tool脚本主要用来创建、删除、查看gfs_SH目录下的脚本  
gfs默认为中文,如果你想使用其他语言的gfs,你可以运行gfs_s目录下的不同语言的gfs和gfs-tool,  
你可以将它们拷贝覆盖到目录下  
## 使用须知
gfs需要用到"GFS_SH_PATH"和"GFS_Software_Source_Path"两个变量  
"GFS_SH_PATH"变量用来指示GFS脚本的所在目录  
"GFS_Software_Source_Path"变量用来指示源码的储存目录  
你可以在.bashrc文件中设置这两个变量  
例如:  
	`export GFS_SH_PATH=/home/user/gfs`  
	`export GFS_Software_Software_Path=/home/user/source`
gfs的运行需要tar、axel、git这些工具
## 编译安装软件的流程
一般来说,编译安装软件分为这几步:  
1.下载软件源码包(download)  
2.configure  
3.编译(make)  
4.安装(install)  
