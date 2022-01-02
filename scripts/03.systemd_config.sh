set -x

read -r -d '' SYSTEMD_CONFIG <<- EOM
[Unit]
Description=Reverse SSH connection
After=network.target

[Service]
ExecStart=/usr/bin/ssh -R 12345:localhost:22 -p $REMOTE_PORT -nfN $REMOTE_ADDR
Restart=always

[Install]
WantedBy=default.target
EOM

echo $SYSTEMD_CONFIG | sudo tee -a /etc/systemd/system/remote_node_connect.service