name             'chruby'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures chruby'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

supports "centos"
supports "ubuntu"

# == Recipes
#

recipe "chruby::setup_chruby",
  "Install and setup chruby"

recipe "chruby::install_1.8",
  "Install and setup ruby 1.8"

recipe "chruby::install_1.9",
  "Install and setup ruby 1.9"

recipe "chruby::install_2.0",
  "Install and setup ruby 2.0"

recipe "chruby::install_2.1",
  "Install and setup ruby 2.1"
