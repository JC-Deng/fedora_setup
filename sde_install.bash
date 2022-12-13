script_dir=$(dirname `which $0`)

git clone https://github.com/mdadams/sde.git  $script_dir/../sde/

systemctl mask oomd