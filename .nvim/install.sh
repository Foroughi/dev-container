#v1.0

apt update
apt install wget git ripgrep fd-find make curl libevent-dev ncurses-dev build-essential bison pkg-config  -y

 #install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
echo export PATH=\"$PATH:/opt/nvim-linux64/bin\"  >> ~/.bashrc

echo export TERM=\"xterm-256color\" >>  ~/.bashrc

echo "cd /code" >> ~/.bashrc


git clone https://github.com/tmux/tmux.git
cd tmux
sh autogen.sh
./configure
make && make install

echo "setup is done"
