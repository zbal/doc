# Quickly setup autossh as reverse tunnel

## Requirements

- sudo installed
- screen installed
- autossh installed
- SSH keys properly set

## In /etc/rc.local

- Will start autoSSH as USER at boot time (avoid running as ROOT)
- Will connect to REMOTE_HOST on port 22
- Will use TCP 20000 and 20001 for autoSSH health check (respawning SSH if needed)
- Reverse tunnel will be available on REMOTE_HOST and ssh user@localhost -p 1234 will connect to SSH (22) of the server autossh is enabled on.
- Will run the autossh command in a screen name autossh, reachable via screen -x autossh when logged as USER

````
sudo -u USER screen -d -m -S autossh autossh -M 20000 -R 1234:localhost:22 -N REMOTE_HOST
````

