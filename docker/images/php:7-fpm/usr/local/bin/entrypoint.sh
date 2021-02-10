#!/bin/bash
# Setup cron
echo '
MAILTO="mklauza@kazar.com"
#ApiHUB
#Import Data
*/1 * * * * date >> /var/www/test
*/5 * * * * php /var/www/bin/console api:import:visits prod >/dev/null 2>&1
*/5 * * * * php /var/www/bin/console api:import:carts prod >/dev/null 2>&1
55 23 * * * php /var/www/bin/console api:import:product prod >/dev/null 2>&1
#Process data#
30 3 * * * php /var/www/bin/console sitemap:k2:products >/dev/null 2>&1
0 5 * * * php /var/www/bin/console process:viewed:products prod >/dev/null 2>&1
0 7 * * * php /var/www/bin/console process:incart:products prod >/dev/null 2>&1
#ApiHUB
' | crontab -
sudo /etc/init.d/cron restart

/usr/local/sbin/php-fpm
