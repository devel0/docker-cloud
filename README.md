# docker-cloud

nextcloud docker

*old version with gui* [here](https://github.com/devel0/docker-cloud/tree/85370dc6a08002e2ba1011599a4bb974b09bfd1d)

## prerequisites

- `/scripts/constants` with `ip_cloud_srv`, `ip_cloud_psql_srv`, `ip_cloud_sync_srv` ip addresses of cloud containers
- `/security/cloud_psql/postgres` clear text password of postgres db user ( must 600 mode )

## configure

| file | token | replace with |
|---|---|---|
| [cloud_sync_cmdline/run.sh](cloud_sync_cmdline/run.sh) | `/nas/cloud` | path to cloud root nas data |
| | `/security/cloud/admin` | path to cloud admin pass file |
| [cloud_sync_cmdline/imgdata/entrypoint.sh](cloud_sync_cmdline/imgdata/entrypoint.sh) | `cloud.searchathing.com` | cloud server name |
| [cloud_sync_cmdline/imgdata/sync.sh](cloud_sync_cmdline/imgdata/sync.sh) | `cloud.searchathing.com` | cloud server name | 
| [cloud_sync_cmdline/imgdata/update_etag](cloud_sync_cmdline/imgdata/update_etag) | `cloud.searchathing.com` | cloud server name | 
| [cloud_sync_cmdline/imgdata/wait_changes](cloud_sync_cmdline/imgdata/wait_changes) | `/nas/cloud` | path to cloud root nas data |

set base folder exclusion in [sync-exclude.lst](cloud_sync_cmdline/imgdata/sync-exclude.lst)

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
