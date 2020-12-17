#!/bin/sh
. $(dirname $0)/config.sh;

logging() {
    message=$1;
    if [ $is_log == y ]
    then
        echo $(date +"%Y/%m/%d %H:%M.%S") + $message >> $(dirname $0)/logs;
    fi
}

connect()
{
    echo "USERNAME:"$username;
    ifdown wan;
    sleep 3s;
    ifup wan;
    sleep 10s;
    . /lib/functions/network.sh;
    network_get_ipaddr ip wan;
    echo "IP:"$ip;
    post_data="wlanuserip=$ip&localIp=&basip=$base_ip&lpsUserName=$username&lpsPwd=$password&schoolId=$school_id"
    curl -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36" \
    -H "Pragma:no-cache" -H "Cache-Control:no-cache" -H "Referer:http://139.198.3.98/sdjd/protalAction!index.action?wlanuserip=$ip&basip=$base_ip" \
    -H "Accept-Encoding:gzip,deflate" -H "Accept-Language:en-US,en;q=0.8,zh-CN;q=0.6,zh;q=0.4" \
    -H "Accept: application/json, text/javascript, */*" -b "JSESSIONID=$JSESSIONID" \
    -d "$post_data" \
    -v "http://139.198.3.98/sdjd/protalAction!portalAuth.action?" -o result.txt;

    cat $(dirname $0)/result.txt;

    result_=$(cat $(dirname $0)/result.txt;)

    logging $result_;
}

chknetwork()
{
    timeout=5
    target=www.baidu.com
    ret_code=`curl -I -s --connect-timeout $timeout $target -w %{http_code} | tail -n1`
    if [ "x$ret_code" = "x200" ];
    then
        echo 1;
    else
        echo 0;
    fi
}

heartbeat()
{
    curl -A "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36" \
    -H "Pragma:no-cache" -H "Cache-Control:no-cache" -H "Referer:http://139.198.3.98/sdjd/protalAction!toSuccess.action" \
    -H "Accept-Encoding:gzip,deflate" -H "Accept-Language:en-US,en;q=0.8,zh-CN;q=0.6,zh;q=0.4" \
    -H "Accept: application/json, text/javascript, */*" -b "JSESSIONID=$JSESSIONID" \
    -v "http://139.198.3.98/sdjd/";
    curl -v "http://www.baidu.com/" > /dev/null;
}

if [ $(chknetwork) == 1 ]
then
    echo "network up, sending heartbeat."
    logging 'Sending heartbeat ...'
    heartbeat;
    logging 'Heartbeat sent'
else
    echo "network down, connecting."
    logging 'connect to network';
    connect;
fi