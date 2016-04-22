#!/bin/sh

NGINX="/usr/local/bin/nginx"
PHP5329="$HOME/.phpbrew/php/php-5.3.29/sbin/php-fpm.dSYM -y $HOME/.phpbrew/php/php-5.3.29/etc/php-fpm.conf -D"
PHP5534="$HOME/.phpbrew/php/php-5.5.34/sbin/php-fpm -y $HOME/.phpbrew/php/php-5.5.34/etc/php-fpm.conf -D"
PHP5618="/usr/local/Cellar/php56/5.6.18/sbin/php-fpm -y /usr/local/etc/php/5.6/php-fpm.conf -D"
PHP70="$HOME/.phpbrew/php/php-7.0.5/sbin/php-fpm -y $HOME/.phpbrew/php/php-7.0.5/etc/php-fpm.conf -D"

PID_PATH="/usr/local/var/run/"

start_app() {
    command=$1
    ver=$2
    pid="$ver.pid"

    if [ -f $pid ]; then
        echo "> ×× $ver is running ..."
    else
        `sudo $command`
    fi
}

stop_app() {
    ver=$1
    pid="$PID_PATH$ver.pid"
    if [ -f $pid ]; then
        sudo kill `cat $pid`
    else
        echo "> ×× $ver is not running."
    fi
}

start () {
    echo "Start php-fpm ..."
    start_app $PHP5329 "php5.3"
    start_app $PHP5534 "php5.5"
    start_app $PHP5618 "php5.6"
    start_app $PHP70 "php7"
    echo "Start Nginx ..."
    start_app $NGINX "nginx"
    echo "Done!"
}

stop() {
    echo "Stop Nginx ..."
    stop_app "nginx"
    echo "Stop php-fpm ..."
    stop_app "php5.3-fpm"
    stop_app "php5.5-fpm"
    stop_app "php5.6-fpm"
    stop_app "php7-fpm"
    echo "Done!"
}

if [ $1 = "start" ]; then
    start
elif [ $1 = "stop" ]; then
    stop
elif [ $1 = "restart" ]; then
    stop
    start
else
    echo "Valid commands: {start|stop|restart}"
fi
