#!/bin/bash

source /root/VARIABLES

nextcloudcmd \
	-s \
	--unsyncedfolders /sync-exclude.lst \
	-u admin -p `cat /security/cloud/admin` \
	/nas \
	"https://$CLOUD_SERVER/remote.php/webdav/$CLOUD_REMOTE_FOLDER" >& /lastsync.log
