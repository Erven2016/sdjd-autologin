# adjd-autologin

代码继承项目[frankgx97/wo201-autologin](https://github.com/frankgx97/wo201-autologin)

Erven2016 修改 | 采用 MIT 协议

## 运行环境

1. 一个已经刷好OpenWRT系统的路由器
2. OpenWRT 已经安装好了 Curl ([如何获取Curl](https://openwrt.org/packages/pkgdata/curl))
3. 已经将网线插到WAN网口上

## 准备一些必须参数

### Base ip (basip)

你可以从浏览器重定向登陆网页的url中找到它哦。

### JESSIONID

从浏览器的Cookies中可以得到，跳转到登陆网页后找名字为JSESSIONID的cookie值。

## 如何使用

### 运行 setup.sh

这个脚本会在当前目录生成运行需要的配置文件。

### 运行 login.sh

这个操作会提交登录表单到验证服务器，如果验证服务器返回了json格式数据： {"msg":"认证成功!","obj":"$with-your-school-id","success":true} ，则代表登录成功。

## 配置自动运行

### 路由器开机时运行

1. 编辑文件 /etc/rc.local
2. 在 `exit 0` 行前添加脚本代码 `/$path_to_sdjd_autologin/login.sh;`
($path_to_sdjdautologin 指的是这个脚本放在的目录路径。)
3. 保存退出

### 设置定时运行

1. 在路由器的ssh shell中运行命令 `crontab -e`
2. 在文件末尾添加语句 `*/5 * * * * /$path_to_sdjd_autologin/login.sh` (你可以设置你想要的定时时间， $path_to_sdjdautologin 指的是这个脚本放在的目录路径。)
3. 保存退出

## 支持的学校列表

请到[英文版](https://github.com/Erven2016/sdjd-autologin/blob/main/README.md)查看