#!/bin/bash
#
# Title:      PGBlitz (Reference Title File)
# Author(s):  Admin9705
# URL:        https://pgblitz.com - http://github.pgblitz.com
# GNU:        General Public License v3.0
################################################################################

### FILL OUT THIS AREA ###
echo 'pgvault' >/var/plexguide/pgcloner.rolename
echo 'PTS-Vault' >/var/plexguide/pgcloner.roleproper
echo 'PTS-Vault' >/var/plexguide/pgcloner.projectname
echo 'master' >/var/plexguide/pgcloner.projectversion
echo 'pgvault.sh' >/var/plexguide/pgcloner.startlink
### START PROCESS
source /opt/plexguide/menu/functions/functions.sh

rolename=$(cat /var/plexguide/pgcloner.rolename)
roleproper=$(cat /var/plexguide/pgcloner.roleproper)
projectname=$(cat /var/plexguide/pgcloner.projectname)
projectversion=$(cat /var/plexguide/pgcloner.projectversion)
startlink=$(cat /var/plexguide/pgcloner.startlink)
mkdir -p "/opt/$rolename"
initial() {
    bash /opt/${rolename}/${startlink}
}
initial
