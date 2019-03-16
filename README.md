# docker-cloud

nextcloud docker

*old version with gui* [here](https://github.com/devel0/docker-cloud/tree/85370dc6a08002e2ba1011599a4bb974b09bfd1d)

## prerequisites

- `/scripts/constants` with `ip_cloud_srv`, `ip_cloud_psql_srv`, `ip_cloud_sync_srv` ip addresses of cloud containers
- `/security/cloud_psql/postgres` clear text password of postgres db user ( must 600 mode )

## configure

| file | variable | description |
|---|---|---|
| [VARIABLES](VARIABLES) | `CLOUD_NAS_ROOT` | path to cloud root nas data |
| " | `CLOUD_ADMIN_PWDFILE` | path to cloud `admin` user pass file |
| " | `CLOUD_SERVER` | cloud server hostname |
| " | `CLOUD_LOCAL_FOLDER` | nas root or other host folder to sync with remote folder | 
| " | `CLOUD_REMOTE_FOLDER` | cloud remote folder or empty |

example

```
CLOUD_NAS_ROOT=/nas/cloud
CLOUD_SERVER=cloud.searchathing.com
CLOUD_ADMIN_PWDFILE=/security/cloud/admin
CLOUD_LOCAL_FOLDER=/nas/cloud
CLOUD_REMOTE_FOLDER=
```

### excluded sync folder

To avoid syncing some local folders ( relativ to CLOUD_NAS_ROOT ) insert these in [sync-exclude.lst](cloud_sync_cmdline/imgdata/sync-exclude.lst)

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

- install cloud_sync_cmdline

```
cd cloud_sync_cmdline
./build.sh
./run.sh
```
