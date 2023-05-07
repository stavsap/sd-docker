FROM nvidia/cuda:12.1.1-runtime-ubuntu22.04

RUN apt-get update
RUN apt-get upgrade -y

RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa -y

RUN apt install python3.10 python3.10-venv python3-pip git ffmpeg libsm6 libxext6 libgl1 wget -y

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin 
RUN mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/3bf863cc.pub
RUN add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/ /" -y
RUN apt-get update
RUN apt-get install libcudnn8=8.9.1.*-1+cuda12.1 libcudnn8-dev=8.9.1.*-1+cuda12.1 libcudnn8-samples=8.9.1.*-1+cuda12.1 -y

RUN useradd -s /bin/bash user
USER user
WORKDIR /home/user
COPY app.py app.py
RUN python3 -m pip install https://files.pythonhosted.org/packages/c1/3f/949d11d42a1cd014806f61ba92de192c7a417dc972a07fb082948f4fb451/xformers-0.0.19-cp310-cp310-manylinux2014_x86_64.whl
CMD python3 app.py