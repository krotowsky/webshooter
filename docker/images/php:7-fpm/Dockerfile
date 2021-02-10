FROM php:7-fpm
ARG USERID=9000
COPY ./usr/ /usr/

RUN chmod +x /usr/local/bin/*

RUN set -ex \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends \
		freetds-dev \
		git \
		sudo \
		nano \
		libfreetype6-dev \
		libicu-dev \
		libxml2-dev \
		libxslt1-dev \
		unixodbc-dev \
		wkhtmltopdf \
		zlib1g-dev \
		libzip-dev \
	&& apt-get clean \
	&& rm -r /var/lib/apt/lists/* \
	\
	&& docker-php-ext-configure pdo_dblib --with-libdir=/lib/x86_64-linux-gnu \
	&& docker-php-ext-configure pdo_odbc --with-pdo-odbc=unixODBC,/usr \
	&& docker-php-ext-install -j$(nproc) \
		mysqli \
		opcache \
		pdo_dblib \
		pdo_mysql \
		pdo_odbc \
		soap \
		sockets \
		xsl \
		zip \
	\
	&& pecl install \
		xdebug \
	&& docker-php-ext-enable \
		sockets \
		xdebug \
	&& rm -rf /tmp/pear \
	\
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


RUN usermod -u 9000 www-data \
    && echo "www-data ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER www-data

EXPOSE 9000

CMD ["php-fpm"]
