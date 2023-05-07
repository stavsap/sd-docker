import os

path = os.getcwd()

print(path)

os.system("whoami")

os.system("git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git")

os.chdir("stable-diffusion-webui")

path = os.getcwd()

print(path)

os.system("echo $LD_LIBRARY_PATH")
os.system("export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu && ./webui.sh")