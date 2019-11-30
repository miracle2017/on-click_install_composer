if command -v curl > /dev/null ; then
    curl --max-time 3600  -o composer-setup.php https://getcomposer.org/installer
else
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
fi

[ $? -eq 0 ] || ( echo "download failed beacuse the bad network, please retry latter"; exit ) && php composer-setup.php && rm -r composer-setup.php && echo "install oj8k" && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

read -p "是否设置全局阿里云镜像,若在中国使用强烈推荐?(y/n)" set

if (($set == 'y')) ; then
    composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
fi
echo "安装完成, 可输入composer help获取更多信息（get more info by typing composer help command)"