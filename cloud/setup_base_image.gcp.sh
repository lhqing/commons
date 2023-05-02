sudo apt update
sudo apt install -y nfs-common wget git tree zsh npm rsync

# create dir for filestore mount
sudo mkdir /mnt/filestore -p
sudo chown nobody:nogroup /mnt/filestore

# install mambaforge
wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh -O $HOME/Mambaforge-Linux-x86_64.sh
bash $HOME/Mambaforge-Linux-x86_64.sh -b -p $HOME/mambaforge
echo 'export PATH=$HOME/mambaforge/bin:$PATH' >> $HOME/.bashrc
source $HOME/.bashrc

# mamba init
mamba init bash
mamba init zsh

conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

# optional tools
sudo npm install -g vtop

# install sky
pip install --upgrade pip
pip install --upgrade "skypilot[gcp]"