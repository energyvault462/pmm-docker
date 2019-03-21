# pmm-docker
Docker container for proxmox-monitor

Runs correctly if go in via bin/bash and run the app.sh manually.
Doesn't work if using a CMD or ENTRYPOINT.... APCUPSD isn't working unless
it is done manually for some reason. 

TODO: fix apcupsd to run automatically. That *should* fix the problems
