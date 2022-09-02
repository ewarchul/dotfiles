```sh
sudo apt update && sudo apt install -y git curl software-properties-common dirmngr
sudo apt update && sudo apt upgrade
```

For Debian < 11:

```sh
git clone https://github.com/ewarchul/dotfiles.git
cd dotfiles

export DEBIAN_FRONTEND=noninteractive
sudo cp debian/sources.list /etc/apt/sources.list
sudo apt update && sudo apt upgrade
sudo apt full-upgrade
bash bootstrap.sh
```

otherwise:

```sh
git clone https://github.com/ewarchul/dotfiles.git
cd dotfiles
bash bootstrap.sh
```




