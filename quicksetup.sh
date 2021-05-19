echo "might ask for sudo if not run as root because of apt\n also if not run as root and sudo not yet installed, this wont work :> \n"

prog=1


sudo apt install git || apt install git

echo "$prog/?: cloning config files"
/bin/git clone -b lightweight https://github.com/Nighmared/dotfiles ~/.config #get some configs

prog=$((prog+1))
echo "$prog/?: installing stuff"
/bin/sudo apt install sudo htop neofetch wget git zsh python3 python3-pip python3-venv command-not-found -y
prog=$((prog+1))
echo "$prog/?: setting zsh as shell"
chsh -s /bin/zsh
prog=$((prog+1))
echo "$prog/?: installing oh-my-zsh"
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"		#install oh-my-zsh
prog=$((prog+1))

#echo "$prog.1/? add pip install location to path"
#echo "export PATH=\"$HOME/.local/bin:\$PATH\"">>~/.config/zsh/.zshrc
export PATH="$HOME/.local/bin:\$PATH" #also for current session
echo "$prog/? installing zsh plugins "
qsetup_orig=$(pwd) #go back to where it was :>
cd ~/.config
/bin/git submodule update --init --recursive #for plugins :facepalm:
cd $qsetup_orig
unset qsetup_orig

/bin/pip3 install pygments
prog=$((prog+1))

echo "$prog/?: symlink zshrc file -.-"
/bin/rm ~/.zshrc
/bin/ln -s ~/.config/zsh/.zshrc ~/.zshrc
prog=$((prog+1))

echo "---------------done--------------"
