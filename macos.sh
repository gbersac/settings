# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/guillaumebersac/.profile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew tap caskroom/cask
brew tap caskroom/versions

brew install vim
brew cask install sublime-text
brew cask install iterm2
brew cask install google-chrome
brew cask install firefox
brew cask install java8
brew cask install lepton
brew install sbt 
