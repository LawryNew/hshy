

tar -zxvf php-7.2.31.tgz  







cd php-7.2.31/

./configure --prefix=/usr/local/php-7.2.31 --with-config-file-path=/usr/local/php-7.2.31/etc --with-curl --with-mhash --with-gd --with-gettext --with-iconv-dir --with-kerberos --with-libdir=lib64 --with-libxml-dir --with-openssl --with-pcre-regex --with-pdo-sqlite --with-pear --with-xmlrpc --with-xsl --with-zlib --enable-fpm --enable-bcmath --enable-libxml --enable-inline-optimization --enable-mbregex --enable-mbstring --enable-opcache --enable-pcntl --enable-shmop --enable-soap --enable-sockets --enable-sysvmsg --enable-sysvsem --enable-sysvshm --enable-xml --enable-zip --enable-static --enable-mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-freetype-dir --with-jpeg-dir --with-png-dir --disable-debug --disable-fileinfo && make && make install 

​		加入环境变量

php —ini 

安装扩展：

​		进入 php-7.2.31.tgz解压后的包

​		cd ext下很多可以扩展的模块文件夹

​			eg:	fileinfo

​			cd  php-7.2.31/ext/fileinfo

​				/usr/local/php-7.2.31/bin/phpize

​				 ./configure  --with-php-config=/usr/local/php-7.2.31/bin/php-config && make && make install

​			php —ini 

​				vim /usr/local/php-7.2.31/etc/php.ini

​					追加扩展  extension = fileinfo.so

​				

​			

​		

​				

