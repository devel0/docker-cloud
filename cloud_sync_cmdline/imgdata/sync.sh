nextcloudcmd \
	--unsyncedfolders /sync-exclude.lst \
	-u admin -p `cat /security/cloud/admin` \
	/nas/cloud \
	https://cloud.searchathing.com/remote.php/webdav >& /lastsync.log
