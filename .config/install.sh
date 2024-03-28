#v1.0

apt update
apt install wget git ripgrep fd-find  curl -y

 #install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
echo export PATH=\"$PATH:/opt/nvim-linux64/bin\"  >> ~/.bashrc

echo export TERM=\"xterm-256color\" >>  ~/.bashrc

echo alias start=\"tmux new-session \\\; send-key \'nvim\' C-m \\\;\"  >> ~/.bashrc
echo "cd ~/project/" >> ~/.bashrc

apt install tmux  -y

echo "setup is done"
