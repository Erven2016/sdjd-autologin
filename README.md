# sdjd-autologin

Project Forked from [frankgx97/wo201-autologin](https://github.com/frankgx97/wo201-autologin)

Modified by Erven2016 | MIT License

## Running environment

1. A router flashed OpenWRT
2. Curl was installed on your router ([Get Curl for OpenWRT](https://openwrt.org/packages/pkgdata/curl))
3. Plug the network cable in WAN slot

## Get some variables essential

### Base ip (basip)

Get it from the url which you were redirected to.

### JSESSIONID

Check cookies of the login webportal, and you will find it with same name in cookies.

## How to use

### Run setup.sh

It will generate a config profile in ./ after you finish all steps.

### Run login.sh

The action will try to submit login form via POST requset, if login pass and the server will return json message "{"msg":"认证成功!","obj":"$with-your-school-id","success":true}".

## Autologin Config

### Connect when your router start up

1. Edit /etc/rc.local
2. Add `/$path_to_sdjd_autologin/login.sh;` before `exit 0`
    ($path_to_sdjd_autologin is the path of this project's directory. )
3. Save and exit
4. 运行命令 `/etc/init.d/cron start && /etc/init.d/cron enable` 使 corn 开机启动与自启。

### Set a timer to execute the shell script

1. run `crontab -e` on the shell of ssh connected to your router
2. add `*/5 * * * * /$path_to_sdjd_autologin/login.sh` in the end 
(You can set the time when you want, and $path_to_sdjd_autologin is the path of this project's directory. )
3. Save and exit
4. run command `/etc/init.d/cron start && /etc/init.d/cron enable` to make cron autostart

## Supported Universities (China Unicom campus network)
| School | School ID | Tested |
| :---: | :---: | :--: |
| Dalian Economic and trade school | 724723 | None |
| Liaoning Public Security and Judicial Management Cadre College | 559842 | None |
| Shandong Lan Xiang Technician College | 640841 | None |
| Heilongjiang University Of Chinese Medicine | 957367 | None |
| Dandong College of Traditional Chinese Medicine | 671186 | None |
| Shandong Technician Institute | 784864 | None |
| Shandong College of Tourism and Hospitality | 566884 | None |
| Dandong secondary occupation technology professional school | 672022 | None |
| Shenyang City University | 661269 | None |
| LIAONING RADIO AND TV UNIVERSITY | 559785 | None |
| The Journal of Shandong Agricultural Administrators College | 559844 | None |
| Qufu Normal University | 1342980 | None |
| Linyi University - Yi Shui | 822837 | None |
| Linyi University | 740086 | Passed |
| Shenyang University of Chemical Technology | 567091 | None |
| Qingdao University - Fu Shan | 817982 | None |
| Shandong University of Finance and Economics - Ming Shui | 510281 | None |
| Shenyang Sport University | 1322194 | None |
| Fuxin Higher Training College | 657804 | None |
| Jilin Engineering Normal University | 769768 | None |
| Rizhao University Block | 1065671 | None |
| Qingdao University - Jin Jia lin | 712748 | None |
| University Of Jinan | 510592 | None |
| Shenyang University | 1166665 | None |
| Heilongjiang University | 1071369 | None |
| Shandong Labor Vocational and Technical College | 668220 | None |
| Liaoning Vocational University of Technology | 695397 | None |

## Need other Language?

