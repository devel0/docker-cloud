# docker-cloud

nextcloud docker

## prerequisites

- `/scripts/constants` with `ip_cloud_srv`, `ip_cloud_psql_srv`, `ip_cloud_sync_srv` ip addresses of cloud containers
- `/security/cloud_psql/postgres` clear text password of postgres db user ( must 600 mode )
- [docker rdp](https://github.com/devel0/docker-rdp)
- [Nextcloud-2.3.3-x86_64.AppImage](https://nextcloud.com/install/#install-clients) for cloud sync

## configure

| file | token | replace with |
|---|---|---|
| [cloud_sync/run.sh](cloud_sync/run.sh) | `cloud.example.com:172.19.0.2` | ip address of docker cloud container |

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

# first configuration

- connect rdp to cloud_sync ( 3389 ) container
- double click on nextcloud desktop icon
- configure nextcloud client ( set server adress, username/password, skip folder configuration, add sync folder connection )

# troubleshoot

## file locks

- from `cloud` container
```
sudo -u www-data ./occ 'files:scan' --all -v
sudo -u www-data ./occ 'files:cleanup'
sudo -u www-data ./occ 'maintenance:mode' --on
```

- from `cloud_psql` container
```
su - postgres
psql
\c cloud
delete from oc_file_locks
```

- from `cloud` container

```
sudo -u www-data ./occ 'maintenance:mode' --off
```

- restart `cloud` container
