# wsl-setup-docker
Setup Docker CE on WSL 2

```bash
# Run setup script.
bash setup.sh
```

```bash
# Add to ~/.bashrc for docker service to auto start.
! service docker status | grep -n 'is running' > /dev/null && echo -e "\033[33m→\033[39m Starting docker service"; service docker start > /dev/null
```