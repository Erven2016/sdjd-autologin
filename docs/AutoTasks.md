# 自动化任务

## 开机时运行

1. 编辑文件 /etc/rc.local
2. 在 `exit 0` 行前添加脚本代码 `/$path_to_sdjd_autologin/login.sh;`
($path_to_sdjdautologin 指的是这个脚本放在的目录路径。)
3. 保存退出

## 定时运行

1. 在路由器的ssh shell中运行命令 `crontab -e`
2. 在文件末尾添加语句 `*/5 * * * * /$path_to_sdjd_autologin/login.sh` (你可以设置你想要的定时时间， $path_to_sdjdautologin 指的是这个脚本放在的目录路径。)
3. 保存退出
4. 运行命令 `/etc/init.d/cron start && /etc/init.d/cron enable` 使 corn 开机启动与自启。
