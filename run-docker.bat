@echo off

docker run -it --gpus=all -e COMMANDLINE_ARGS="--listen --xformers" -e LD_LIBRARY_PATH=/usr/lib/x86_64_linux-gnu/ -v G:/sd_docker_volume:/home/user/stable-diffusion-webui -v sd-cache:/home/user/.cache -p 8080:7860 --rm a1111

echo All Complete!!! Press any key to exit...
pause >nul