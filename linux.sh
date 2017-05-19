# last version of git
sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install -y git

# install sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt

# install ammonite
sudo apt-get install -y default-jre
sudo curl -L -o /usr/local/bin/amm https://git.io/vXVf5 && sudo chmod +x /usr/local/bin/amm

# others
sudo apt-get install -y vim
sudo apt-get install -y tig
sudo apt-get install -y zsh-syntax-highlighting
