# Should be cloned to the top level of home directory.

hostnamectl set-hostname sde

dnf upgrade -y
dnf install vim -y
dnf install gparted -y

systemctl enable sshd
systemctl start sshd

file=/etc/ssh/sshd_config
cp -p $file $file.old &&
awk '
$1=="#PubkeyAuthentication" {$1="PubkeyAuthentication"}
{print}
' $file.old > $file
rm -f $file.old

dnf install zsh -y

echo "Get oh-my-zsh."
echo "sh -c "\$\(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh\)""

echo "Get ZSH plugins."
echo "git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
echo "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

echo "Copy .zshrc."
echo "cp ~/fedora_setup/.zshrc ~/"

echo "Change default shell to zsh using the following command."
echo "usermod -s $(which zsh) $(whoami)"

echo "***********************************************************"
echo "Need to add .pub to authorized_keys and set permits to 644."