npm run build > /dev/null 2>&1

cat << EOF > /etc/systemd/system/myserver.service
Description=index.js 
Documentation=https://example.com
After=network.target
[Service]
Environment=NODE_PORT=3000
Type=simple
User=root
ExecStart=/usr/bin/node /opt/codedeploy-agent/index.js
Restart=on-failure
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable myserver.service
sudo systemctl start myserver.service
