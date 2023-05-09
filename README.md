# Stable Diffusion A1111 for Docker on windows or WSL 2.0

## Stable Diffusion A1111 on Docker (Windows)

The build and the first time run takes several minutes, just be patient.

if run-docker.bat is used, modify the mount to your local file system. the web ui will be at localhost:8080

## Stable Diffusion A1111 on WSL 2.0

### Install WSL 2.0 Ubuntu Distro via CMD or download 

[WSL Manual](https://github.com/MicrosoftDocs/WSL/blob/main/WSL/install-manual.md)

Install Manual: https://aka.ms/wslubuntu2204

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
sed -i 's/#export COMMANDLINE_ARGS=""/export COMMANDLINE_ARGS="--listen --xformers"/' webui-user.sh
./webui.sh
```

### Networking

Get the IP of the ubuntu instance, in ubuntu shell:

``` shell
ip addr show
```

make port proxy from windows host

[WSL Networking](https://learn.microsoft.com/en-us/windows/wsl/networking)

in windows CMD type:

``` shell
netsh interface portproxy add v4tov4 listenport=4000 listenaddress=0.0.0.0 connectport=7860 connectaddress=<your-ubuntu-ip>
```

in browser, access via http://localhost:4000

### File System

To access files inside your WSL, type in the file browser

``` shell
\\wsl$\<Distro>
```

For example for Ubuntu Distro

``` shell
\\wsl$\Ubuntu
```

## Install Tortoise-TTS-Fast on WSL 2.0 (Ubuntu)

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

sudo wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin 
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /" -y
sudo apt-get update
sudo apt-get install libcudnn8=8.9.1.*-1+cuda12.1 libcudnn8-dev=8.9.1.*-1+cuda12.1 libcudnn8-samples=8.9.1.*-1+cuda12.1 -y

git clone https://github.com/thisserand/tortoise-tts-fast.git
cd tortoise-tts-fast
pip install -e .
pip install git+https://github.com/152334H/BigVGAN.git
python3 -m pip install streamlit
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu
python3 -m streamlit run scripts/app.py
```

### Kohya SS for WSL 2.0

``` shell
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt install python3.10 python3.10-venv python3-pip git python3.10-tk ffmpeg libsm6 libxext6 libgl1 wget -y
sudo apt install nvidia-cuda-toolkit -y

git clone https://github.com/bmaltais/kohya_ss
cd kohya_ss
./setup.sh -v
source venv/bin/activate
pip install bitsandbytes-cuda117
pip install xformers
./gui.sh --share
```
