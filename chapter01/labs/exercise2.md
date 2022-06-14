Primero corremos el nginx.  
`mkdir -p ~/.config/systemd/user`
`cd`
`cd .config/systemd/user/`
`podman ps`
`podman generate systemd --files --new --name nginx`
`cat container-nginx.service` 
`podman stop nginx`
`podman rm nginx`
`systemctl --user daemon-reload`
`systemctl --user enable --now container-nginx`
`systemctl --user status container-nginx`
`curl localhost:8080`
