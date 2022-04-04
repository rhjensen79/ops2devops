# 4. Extra tasks if there is time

## Examine the content of af volume

- Run `docker volume ls` to see the volumes
- Run `docker volume inspect VolumeName` on the volume you want to see details on.
- Copy the path under `Mountpoint`
- Run `sudo ls MountPointPath` to see the files in the volume.
- Note it's only possible to see the files, using sudo, due to permissions.
