### For installing nvidia-375
#### Ref
http://www.nvidia.com/object/gpu-accelerated-applications-tensorflow-installation.html

#### Terminal
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt install nvidia-375

sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda

sudo apt-get purge nvidia-*
sudo service lightdm stop
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt install nvidia-375
