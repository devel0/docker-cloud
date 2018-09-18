# docker-cloud

nextcloud docker

## prerequisites

- `/scripts/constants` with `ip_cloud_srv`, `ip_cloud_psql_srv`, `ip_cloud_sync_srv` ip addresses of cloud containers
- `/security/cloud_psql/postgres` clear text password of postgres db user ( must 600 mode )
- [docker rdp](https://github.com/devel0/docker-rdp)
- [Nextcloud-2.3.3-x86_64.AppImage](https://nextcloud.com/install/#install-clients) for cloud sync

## install

- install cloud postgres

```
cd cloud_psql
./run.sh
cd ..
```

- install cloud

```
cd cloud
./run.sh
cd ..
```

- install cloud_sync

```
cd cloud_sync
./build.sh
./run.sh
```
