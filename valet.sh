#!/bin/sh

#
#  Valet.sh
#  Created by Guillaume Bouyer on 14/04/2020.
#  
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update
brew install composer
brew install php@7.4
brew service start php
brew install mysql@5.7
brew services start mysql@5.7
composer global require laravel/valet
echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
valet install
valet use php@7.4
mkdir ~/Sites
cd ~/Sites
valet park
composer global update
brew install wget
brew install phpmyadmin
ln -s $(brew --prefix)/share/phpmyadmin ~/Sites/phpmyadmin
echo 'Finish! ;)'
