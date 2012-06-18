# Create a repository locally, using debmirror

Create a cronjob that will perform the sync of the repository on a regular basis.

```
root@debian-repo:/etc/cron.d# cat debian-repo 
# Sync debian squeeze main , main/debian-installer
0 2 * * * repo-debian debmirror -p -v --host=ftp.tw.debian.org  --method=rsync --dist=squeeze,squeeze-updates --arch=amd64 --di-dist=squeeze --di-arch=amd64 --nosource --diff=none --section=main,main/debian-installer --exclude-deb-section='^debug|xfce|kde|zope|news|games$' /var/www/repo-data/debian

# Sync debian-security for squeeze
0 3 * * * repo-debian debmirror -p -v --diff=none --host=mirrors.bloomu.edu --root=debian-security  --method=rsync --dist=squeeze/updates --arch=amd64 --nosource --section=main --exclude-deb-section='^debug|xfce|kde|zope|news|games$' /var/www/repo-data/debian-security
```