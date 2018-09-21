#!/bin/bash
# to run the script "sudo /bin/sh /Odoo\ Script.sh" or "sudo ./Odoo\ Script.sh"
################################################################################
# Script for preparing Odoo developing platform on Ubuntu 14.04, 15.04, 16.04 and 18.04 (could be used for other version too)
# Author:     Amr Mondy, Mohamed Zaghloul (Server-Store-Company)
# Mobile No:  +201120241217, +201111828825
# Email:      amr.mondy@zoho.com, muhamedzego@zoho.com & serverstore.eg@zoho.com
# Website:    https://www.facebook.com/Mondylol & https://www.facebook.com/ServerStoreCompany
#-------------------------------------------------------------------------------
# This script will make ur computer ready for developing on Odoo from 8 to 11
#-------------------------------------------------------------------------------
# Make a new file:
# sudo nano /Odoo\ Script.sh
# Place this content in it and then make the file executable:
# sudo chmod +x /Odoo\ Script.sh
# git clone --depth 1 --branch 10.0 https://www.gitlab.com/mah007/odoo .
# Execute the script to install Odoo:
# ./Odoo\ Script.sh
################################################################################
 
##NOTE: this script after installing Ubuntu 18.04 Bionic. 
##fixed parameters
#odoo instead of odoo use ur user name .EG OE_USER="mahmoud"
OE_USER="odoo"
OE_USER2="serverstore"

#The default port where this Odoo instance will run under (provided you use the command -c in the terminal)
#Set to true if you want to install it, false if you don't need it or have it already installed.
INSTALL_WKHTMLTOPDF="True"

# Set this to True if you want to install Odoo 9 10 11 Enterprise! ( you can use enterprise normaly too ;) )
IS_ENTERPRISE="True"

##
###  WKHTMLTOPDF download links
## === Ubuntu Bionic x64 === (for other distributions please replace these two links,
## in order to have correct version of wkhtmltox installed, for a danger note refer to 
## https://www.odoo.com/documentation/11.0/setup/install.html#deb ):
WKHTMLTOX_X64=https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.xenial_amd64.deb
WKHTMLTOX_X32=https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.xenial_i386.deb
#--------------------------------------------------
# Update Server
#--------------------------------------------------
    echo -e "\n---- Update Server ----"
sudo apt-get update
sudo apt-get upgrade -y
    echo -e "\n---- Add Odoo User to Server System ----"
sudo adduser odoo
    echo -e "\n---- Install Oracle Java & JDK ----"
sudo apt-get install wget -y
sudo apt-get install default-jre -y
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo add-apt-repository ppa:linuxuprising/java
sudo apt-get update
#sudo apt install oracle-java10-installer -y
#sudo apt install oracle-java10-set-default -y
sudo apt-get install default-jdk -y
sudo apt-get install oracle-java8-installer -y

#--------------------------------------------------
# Install Wkhtmltopdf if needed
#--------------------------------------------------
if [ $INSTALL_WKHTMLTOPDF = "True" ]; then
  echo -e "\n---- Install wkhtml and place shortcuts on correct place for ODOO 9 ----"
  #pick up correct one from x64 & x32 versions:
  if [ "`getconf LONG_BIT`" == "64" ];then
      _url=$WKHTMLTOX_X64
  else
      _url=$WKHTMLTOX_X32
  fi
  sudo wget $_url
  sudo gdebi --n `basename $_url`
  sudo ln -s /usr/local/bin/wkhtmltopdf /usr/bin
  sudo ln -s /usr/local/bin/wkhtmltoimage /usr/bin
else
  echo "Wkhtmltopdf isn't installed due to the choice of the user!"
fi


#--------------------------------------------------
# Install Dependencies
#--------------------------------------------
    echo -e "\n---- Install Tool Packages ----"
sudo apt install git python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less -y
sudo apt-get install software-properties-common -y
sudo apt-add-repository universe
sudo apt --fix-broken install python-pycurl python-apt
sudo apt-get install wget subversion git bzr bzrtools python-pip python3-pip gdebi-core -y pysassc
    echo -e "\n---- Install Python Packages ----"
sudo apt-get install python-dateutil python-feedparser python-ldap python-libxslt1 python-lxml python-mako python-openid python-psycopg2 python-pybabel python-pychart python-pydot python-pyparsing python-reportlab python-simplejson python-tz python-vatnumber python-vobject python-webdav python-werkzeug python-xlwt python-yaml python-zsi python-docutils python-psutil python-mock python-unittest2 python-jinja2 python-pypdf python-decorator python-requests python-passlib python-pil python-gpgme python-launchpadlib build-essential python-all-dev python-setuptools python-imaging python-suds python-xlsxwriter python-wheel -y
sudo apt-get install python -y
sudo apt-get install python3 -y
sudo apt-get install python-pip -y
sudo apt-get install python3-pip -y
    echo -e "\n---- Install Python Libraries ----"
sudo pip install gdata psycogreen
sudo -H pip install suds
    echo -e "\n--- Install Other Required Packages"
sudo apt-get install node-clean-css -y
sudo apt-get install node-less -y
sudo apt-get install python-gevent -y
sudo apt-get install nodejs npm -y
sudo npm install -g less
sudo npm install -g less-plugin-clean-css  
sudo apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev python3-dev
sudo apt-get install -y libxml2-dev libxslt1-dev zlib1g-dev python3-pip python3-wheel python3-setuptools
sudo -H pip3 install phonenumbers
sudo apt install -y python3-asn1crypto 
sudo apt install -y python3-babel python3-bs4 python3-cffi-backend python3-cryptography python3-dateutil python3-docutils python3-feedparser python3-funcsigs python3-gevent python3-greenlet python3-html2text python3-html5lib python3-jinja2 python3-lxml python3-mako python3-markupsafe python3-mock python3-ofxparse python3-openssl python3-passlib python3-pbr python3-pil python3-psutil python3-psycopg2 python3-pydot python3-pygments python3-pyparsing python3-pypdf2 python3-renderpm python3-reportlab python3-reportlab-accel python3-roman python3-serial python3-stdnum python3-suds python3-tz python3-usb python3-vatnumber python3-werkzeug python3-xlsxwriter python3-yaml
sudo pip3 install vobject qrcode
sudo apt install libldap2-dev libsasl2-dev
sudo pip3 install pyldap
sudo pip3 install num2words
sudo pip3 install -r requirements.txt
wget -qO- https://deb.nodesource.com/setup | bash -
    echo -e "\n---- Installing Enterprise Specific Libraries ----"
sudo apt-get install nodejs -y
sudo apt-get install npm -y
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo npm install -g less
    echo -e "\n---- Every thing is ready ----"
    echo -e "\n---- Install Virtualenvwrapper ----"
sudo apt install virtualenvwrapper -y
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
sudo apt install build-essential python3-dev libxslt-dev libzip-dev libldap2-dev libsasl2-dev -y

#--------------------------------------------------
# Install PostgreSQL Server
#--------------------------------------------------
    echo -e "\n---- Install PostgreSQL Server ----"
sudo apt-get install postgresql -y
sudo postgresql-setup --initdb --unit postgresql
    echo -e "\n---- Start PostgreSQL Server ----"
sudo systemctl enable postgresql
sudo systemctl start postgresql
    echo -e "\n---- Creating the ODOO PostgreSQL User  ----"
sudo su - postgres -c "createuser -s $OE_USER"
sudo su - postgres -c "createuser -s $OE_USER2"


#--------------------------------------------------
# Install Odoo Server
#--------------------------------------------------
    echo -e "\n---- Install Odoo Server ----"
cd /var/lib
mkdir odoo
wget -O - https://nightly.odoo.com/odoo.key | apt-key add -
    echo "deb http://nightly.odoo.com/11.0/nightly/deb/ ./" >> /etc/apt/sources.list.d/odoo.list
sudo apt-get update && apt-get install odoo -y
sudo pip install evdev
sudo pip3 install evdev

##Create an isolated environment    

#Now we can create a virtual environment for Odoo like this:
#    echo -e "n\---- Create an isolated environment ----"
#$ mkvirtualenv -p /usr/bin/python3 odoo-venv

#With this command, we ask for an isolated Python3 environment that will be named “odoo-env”. If the command works as expected, your shell is now using this environment. Your prompt should have changed to remind you that you are using an isolated environment. You can verify with this command:

#$ which python3

#This command should show you the path to the Python interpreter located in the isolated environment directory.

#Now let’s install the Odoo required python packages:

#$ cd your_odoo_sources_path
#$ pip install -r requirements.txt

#After a little while, you should be ready to run odoo from the command line as explained above.

#When you you want to leave the virtual environment, just issue this command:

#deactivate

#Whenever you want to work again with your ‘odoo-venv’ environment:

#$ workon odoo-venv


#sudo apt install git python3-pip build-essential wget python3-dev python3-venv python3-wheel libxslt-dev libzip-dev libldap2-dev libsasl2-dev python3-setuptools node-less

#git clone https://www.github.com/odoo/odoo --depth 1 --branch 11.0 /opt/odoo/odoo11

#cd /opt/odoo
#python3 -m venv odoo11-venv
#source odoo11-venv/bin/activate
#pip3 install wheel
#pip3 install -r odoo11/requirements.txt
#deactivate
#exit
#sudo mkdir /opt/odoo/odoo11-custom-addons
#sudo chown odoo: /opt/odoo/odoo11-custom-addons
#sudo cp /opt/odoo/odoo11/debian/odoo.conf /etc/odoo11.conf
#vim /etc/odoo11
#[options]
#; This is the password that allows database operations:
#admin_passwd = my_admin_passwd
#db_host = False
#db_port = False
#db_user = odoo
#db_password = False
#addons_path = /opt/odoo/odoo11/addons
#; If you are using custom modules
#; addons_path = /opt/odoo/odoo11/addons,/opt/odoo/odoo11-custom-addons



    echo "-----------------------------------------------------------"
    echo "Done! The Odoo developing platform is ready:"

    echo "you can now install pycharm community of professional"

    echo "using sudo apt-get install pycharm or pycharm-community"

    echo "Restart restart ur computer and start developing and have fun ;)"
    echo "-----------------------------------------------------------"
