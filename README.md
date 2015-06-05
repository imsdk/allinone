# allinone  服务端
## 安装环境
1. cpu x86 64位
2. 内存 >= 4G（取决于mongodb、mysql系统要求）
3. CentOS6, RH6 或以上版本

## 安装步骤如下
1. 先安装我们已经准备好的[一键安装第三方依赖包](https://github.com/imsdk/allinone-dep), 

2.安装后台服务
  IMSDK-Server 目录下执行setup.sh 
  可通过 ./checktool   $Appkey 检查安装环境

  如：./checktool e356440c5421d4db8deeXXXX

# allinone  iOS客户端

##配置步骤
1. IMSDK-iOS目录下IMSDK-Lib文件夹下，修改Setting.plist文件中的配置项。其中，IPSettings下的IMDomainName对应IM通讯域名，IMDefaultAddress对应默认通讯IP和端口

2. 参照[IMSDK官方文档](http://docs.imsdk.im)上的快速入门和API接口文档嵌入SDK。


# allinone  Android客户端

##配置步骤
1. IMSDK-android目录下IMSDK-Lib文件夹下，修改res/raw/imsdk_config.properties文件中的配置项。其中，im_domain对应IM通讯域名，im_ip对应默认通讯IP，im_port对应默认通讯端口

2. 参照[IMSDK官方文档](http://docs.imsdk.im)上的快速入门和API接口文档嵌入SDK。


