#Install last CUDA version. 10.0 in my case.
echo 'Do you want to install the Nvidia drivers? (y|n)'
read nvdrivers
if [ "$nvdrivers" = "y" ]; then
	sudo add-apt-repository ppa:graphics-drivers/ppa
	sudo apt-get update
	sudo ubuntu-drivers devices
	sudo ubuntu-drivers autoinstall
	echo "System needs to be rebooted. When ready, run this script again, and select 'no' to skip the installation of Nvidia drivers"
	read -p "[press a enter to continue]"
	echo "Rebooting System in 3..."
	sleep 1
	echo "Rebooting System in 2..."
	sleep 1
	echo "Rebooting System in 1..."
	sleep 1
	sudo reboot
fi
sudo apt-get install freeglut3 freeglut3-dev libxi-dev libxmu-dev
echo -e "\e[7mRemember to say NO when asked to install the latest Nvidia driver \e[7m"
wget https://developer.nvidia.com/compute/cuda/10.0/Prod/local_installers/cuda_10.0.130_410.48_linux
sudo bash cuda_*
rm cuda*
echo "export PATH=/usr/local/cuda-10.0/bin${PATH:+:${PATH}}" >> ~/.profile
echo "export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}" >> ~/.profile
wget https://repo.anaconda.com/archive/Anaconda3-5.3.0-Linux-x86_64.sh
sudo bash Anaconda*
source  ~/.bashrc 
rm Anaconda*
echo "Now installing Visual Studio Code"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code
sudo reboot
