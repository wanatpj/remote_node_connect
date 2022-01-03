set -x

SYSTEMD_CONFIG=$(cat << EOM
[Unit]
Description=Reverse SSH connection
After=network.target

[Service]
ExecStart=/usr/bin/ssh -R 12345:localhost:22 -p $REMOTE_PORT -nfN $REMOTE_ADDR
Restart=always
User=$(whoami)

[Install]
WantedBy=default.target
EOM
)

echo "$SYSTEMD_CONFIG" | sudo tee /etc/systemd/system/remote_node_connect.service

sudo systemctl daemon-reload
sudo systemctl start remote_node_connect.service