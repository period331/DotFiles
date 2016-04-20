#!/bin/sh

NGINX="/usr/local/bin/nginx"
PHP5329="$HOME/.phpbrew/php/php-5.3.29/sbin/php-fpm.dSYM"
PHP5618="/usr/local/Cellar/php56/5.6.18/sbin/php-fpm"
PHP70="$HOME/.phpbrew/php/php-7.0.5/sbin/php-fpm"

PHP5329_PID_PATH="/usr/local/var/run/php5.3-fpm.pid"
PHP5618_PID_PATH="/usr/local/var/run/php-fpm.pid"
PHP70_PID_PATH="/usr/local/var/run/php7-fpm.pid"

NGINX_PID_PATH="/usr/local/var/run/nginx.pid"

start () {
    echo "Start php-fpm ..."

    if [ -f $PHP5329_PID_PATH ]; then
        echo "> × PHP 5.3.29 is running ..."
    else
        sudo $PHP5329 -y $HOME/.phpbrew/php/php-5.3.29/etc/php-fpm.conf -D
    fi
    if [ -f $PHP5618_PID_PATH ]; then
        echo "> × PHP 5.6.18 is running ..."
    else
        sudo $PHP5618 -y /usr/local/etc/php/5.6/php-fpm.conf -D
    fi

    if [ -f $PHP70_PID_PATH ]; then
        echo "> × PHP 7.0.5 is running ..."
    else
        sudo $PHP70 -y $HOME/.phpbrew/php/php-7.0.5/etc/php-fpm.conf -D
    fi
    echo "Start nginx ..."
    if [ -f $NGINX_PID_PATH ]; then
        echo '> × Nginx is running ...'
    else
        sudo $NGINX
    fi
    echo "Done!"
}

stop() {
    echo "Stop nginx ..."
    sudo kill `cat $NGINX_PID_PATH`

    echo "Stop php-fpm ..."
    sudo kill `cat $PHP5329_PID_PATH`
    sudo kill `cat $PHP5618_PID_PATH`
    sudo kill `cat $PHP70_PID_PATH`

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
    echo "\nValid commands: "
    echo "start | stop | restart"
fi

