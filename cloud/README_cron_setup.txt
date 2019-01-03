in order to plan periodical locks cleanup ensure to setup a cron job through following from inside the container:

apt-get update && apt-get install -y nano cron
echo "*/15 * * * * su - www-data -s /bin/bash -c \"php -f /var/www/html/cron.php\""| crontab -

then edit /entrypoint.sh and add following, just before last line 'exec "$@"'

service cron start
