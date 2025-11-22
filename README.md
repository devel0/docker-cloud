# docker-cloud

nextcloud docker

## prerequisites

- setup security

```sh
mkdir /root/security
chmod 700 /root/security
apt install -y pwgen
pwgen -s 32 -n 1 > /root/security/cloud-psql
pwgen -s 32 -n 1 > /root/security/elasticsearch
```

## install psql

```sh
./run-psql.sh
docker exec cloud-psql su - postgres -c "createdb cloud"
```

## install redis

```sh
./run-redis.sh
```

## install elasticsearch

```sh
./run-elasticsearch.sh
```

## install cloud

```sh
./run-cloud.sh
```

## setup nginx

- replace `xxx.yyy.zzz.www` with the ip of the host where cloud installed
- install [acme letsencrypt][1]

```conf
server {
  root /var/www/html;

  server_name cloud.my.com;

  location / {
    include /etc/nginx/mime.types;

    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;

    client_max_body_size 0;
    proxy_set_header Host $host;
    proxy_pass http://xxx.yyy.zzz.www;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;    
  }

  listen 443 ssl;

  ssl_certificate /etc/letsencrypt/live/my.com/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/my.com/privkey.pem;
  include /etc/letsencrypt/options-ssl-nginx.conf;
  ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem;

}
server {
  if ($host = cloud.my.com) {
    return 301 https://$host$request_uri;
  }

  server_name cloud.my.com;
  listen 80;
  return 404;
}
```

## setup cloud sync (optional)

if want to sync cloud with local nas, build the image

```sh
docker build -t cloudsync cloud-sync
```

then run using ( replace ARGS )

```sh
docker run cloudsync nextcloudcmd ARGS
```

example

```sh
mkdir /root/scripts
cp sync-exclude.lst /root/scripts

docker run \
	-v /root/scripts/sync-exclude.lst:/etc/Nextcloud/sync-exclude.lst \
  -v /nas:/nas \
  cloudsync \
  nextcloudcmd \
  --path myremotefolder \
  /nas/mylocalfolder \
  https://admin:$(cat /security/cloud/admin)@cloud.my.com
```

note: the cloud client cmd executes one-shot and then terminate without looking further changes ; the above command can be easily wrapped into a script that executes the command in a loop with some delay between executions

[1]: https://github.com/devel0/knowledge/blob/22ef70b1c6094840f2205312a7784f95228460f9/doc/letsencrypt-acme-dns.md