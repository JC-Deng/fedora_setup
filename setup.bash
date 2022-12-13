# Should be cloned to the top level of home directory.

hostnamectl set-hostname sde

dnf upgrade -y
dnf install vim -y

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
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Change default shell to zsh.
usermod -s $(which zsh) $(whoami)

script_dir=$(dirname `which $0`)

git clone https://github.com/zsh-users/zsh-autosuggestions $script_dir/../.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $script_dir/../.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

rm $script_dir/../.zshrc
cp $script_dir/.zshrc $script_dir/../

echo "***********************************************************"
echo "Need to add .pub to authorized_keys and set permits to 644."