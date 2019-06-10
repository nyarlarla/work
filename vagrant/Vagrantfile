# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/bionic64"
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 3000, host: 3000

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.


  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
   config.vm.provision "shell", inline: <<-SHELLSC
     function install {
           echo installing $1
               shift
                   apt-get -y install "$@" >/dev/null 2>&1
     }

     echo updating package information
     apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
     apt-get -y update >/dev/null 2>&1

     install 'development tools' build-essential

     install Ruby ruby2.5 ruby2.5-dev
     update-alternatives --set ruby /usr/bin/ruby2.3 >/dev/null 2>&1
     update-alternatives --set gem /usr/bin/gem2.3 >/dev/null 2>&1
     echo installing Bundler
     echo "gem: --no-ri --no-rdoc" > ~/.gemrc
     gem install bundler -N >/dev/null 2>&1
     install Git git
     install SQLite sqlite3 libsqlite3-dev
     install 'Nokogiri dependencies' libxml2 libxml2-dev libxslt1-dev zlib1g-dev
     install 'ExecJS runtime' nodejs
     echo 'Installing rails'
     gem install rails
     gem install railties
     gem install listen
     gem install puma
     gem install sass
     gem install tilt
     gem install spring
     gem install byebug
     gem install chromedriver-helper
     gem install sqlite3
     gem install rest-client
     update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
     echo 'You are now on Rails!'
     echo '        o o o o o o o . . .    ______________________________ _____=======_||____'
     echo '    o      _____            |                            | |                 |'
     echo '  .][__n_n_|DD[  ====_____  |                            | |                 |'
     echo ' >(________|__|_[_________]_|____________________________|_|_________________|'
     echo ' _/oo OOOOO oo`  ooo   ooo  `o!o!o                  o!o!o` `o!o         o!o`  '
     echo ' -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-'
   SHELLSC
end
