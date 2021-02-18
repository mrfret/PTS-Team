#!/bin/bash
function sudocheck () {
  if [[ $EUID -ne 0 ]]; then
    tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⛔️  You Must Execute as a SUDO USER (with sudo) or as ROOT!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
    exit 0
  fi
}
function updatesystem() {
    tee <<-EOF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⛔️  This can take a while
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EOF
    sleep 1
upgrades="update upgrade dist-upgrade autoremove"
for i in ${upgrades}; do
    sudo apt $i -yqq 1>/dev/null 2>&1
    sleep 1
done
clone
}
function clone() {
    sudo rm -rf /opt/pgvault
    sudo git clone --quiet https://github.com/doob187/PGVault.git /opt/pgvault
    rm -rf /opt/plexguide/menu/pgvault/pgvault.sh
    mv /opt/pgvault/newpgvault.sh /opt/plexguide/menu/pgcloner/pgvault.sh
    sudo chown -cR 1000:1000 /opt/pgvault/ 1>/dev/null 2>&1
    sudo chmod -cR 755 /opt/pgvault 1>/dev/null 2>&1
    sudo bash /opt/plexguide/menu/pgcloner/pgvault.sh
}
sudocheck
updatesystem
