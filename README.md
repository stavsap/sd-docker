# Stable Diffuaion A1111 Docker

The build and the first time run takes several minutes, just be patient.

if run-docker.bat is used, modify the mount to your local file system. the web ui will be at localhost:8080


# Stable Diffuaion A1111 on WSL 2.0
## Install WSL 2.0 Ubuntu Distro via CMD or download 

[WSL Manual](https://github.com/MicrosoftDocs/WSL/blob/main/WSL/install-manual.md)

in WSL ubuntu shell:

``` shell
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt install python3.10 python3.10-venv python3-pip git ffmpeg libsm6 libxext6 libgl1 wget -y

wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.1.1/local_installers/cuda-repo-wsl-ubuntu-12-1-local_12.1.1-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-12-1-local_12.1.1-1_amd64.deb
sudo cp /var/cuda-repo-wsl-ubuntu-12-1-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda

git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
cd stable-diffusion-webui
./webui.sh
```

### Networking

Get the IP of the ubuntu instance:

``` shell
ip addr show
```

make port proxy from windows host

[WSL Networking](https://learn.microsoft.com/en-us/windows/wsl/networking)

``` shell
netsh interface portproxy add v4tov4 listenport=4000 listenaddress=0.0.0.0 connectport=7860 connectaddress=<your-ubuntu-ip>
```

access via http://localhost:4000

### File System

To access files inside your WSL, type in the file browser

``` shell
\\wsl$\<Distro>
```

For example for Ubuntu Distro

``` shell
\\wsl$\Ubuntu
```
