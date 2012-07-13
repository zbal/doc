# Create a repository locally, using debmirror

Create a cronjob that will perform the sync of the repository on a regular basis.

# Debian
Debian repository and updates are in a different location as from debian-security...

## Add keyring
Adding to the GPG keyring is required if you want to ...

Get the keyrings from wherever u can, existing servers, etc.

````
gpg --keyring /usr/share/keyrings/debian-archive-keyring.gpg --export | gpg --no-default-keyring --keyring trustedkeys.gpg --import
gpg --keyring /usr/share/keyrings/ubuntu-archive-keyring.gpg --export | gpg --no-default-keyring --keyring trustedkeys.gpg --import
````


## Sync main and update repo

````
0 2 * * * repo-debian debmirror -p -v --host=ftp.tw.debian.org  --method=rsync --dist=squeeze,squeeze-updates --arch=amd64 --di-dist=squeeze --di-arch=amd64 --nosource --diff=none --section=main,main/debian-installer --exclude-deb-section='^debug|xfce|kde|zope|news|games$' /var/www/repo-data/debian
````

## Sync debian-security for squeeze
````
0 3 * * * repo-debian debmirror -p -v --diff=none --host=mirrors.bloomu.edu --root=debian-security  --method=rsync --dist=squeeze/updates --arch=amd64 --nosource --section=main --exclude-deb-section='^debug|xfce|kde|zope|news|games$' /var/www/repo-data/debian-security
````

# Ubuntu
Similar approach as for debian, but all the sections to sync are usually available in 1 location

````
0 2 * * * repo-debian debmirror -p -v --host=ftp.tw.debian.org  --method=rsync --dist=precise,precise-updates,precise-security --arch=amd64 --di-dist=precise --di-arch=amd64 --nosource --diff=none --section=main,main/debian-installer --exclude-deb-section='^debug|xfce|kde|zope|news|games$' /var/www/repo-data/ubuntu
````


# Create the links for the netboot kernel
Only needed if you plan on working on virt-install.
Reason seems to be that the kernel is not synced in main/installer-amd64/current/images/netboot/xen, but is available in main/installer-amd64/current/images/netboot/gtk/(ubuntu|debian)-installer/amd64/

Create links that won't be erased on next sync.

````
cd /var/www/repo-data/(ubuntu|debian)/dists/$DIST/main/installer-amd64/current/images/netbook/xen
````

- for Debian (as root so the links have the good ownership):

````
ln -s ../gtk/debian-installer/amd64/initrd.gz .
ln -s ../gtk/debian-installer/amd64/linux vmlinuz
````

- for Ubuntu (as root so the links have the good ownership):

````
ln -s ../gtk/ubuntu-installer/amd64/initrd.gz .
ln -s ../gtk/ubuntu-installer/amd64/linux vmlinuz
````