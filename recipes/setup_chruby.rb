#
# Cookbook Name:: chruby
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "/tmp/chruby-0.3.8.tar.gz" do
  source "chruby-0.3.8.tar.gz"
  mode "0644"
end

script "install-chruby" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar xzpf chruby-0.3.8.tar.gz
    cd chruby-0.3.8 
    make install
    echo 'source /usr/local/share/chruby/chruby.sh' >> ~/.bashrc
    echo 'source /usr/local/share/chruby/auto.sh' >> ~/.bashrc
  EOH
end

cookbook_file "/tmp/ruby-install-0.3.4.tar.gz" do
  source "ruby-install-0.3.4.tar.gz"
  mode "0644"
end


script "install-ruby-install" do
  interpreter "bash"
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar xzpf ruby-install-0.3.4.tar.gz
    cd ruby-install-0.3.4
    make install
  EOH
end

template "/etc/profile.d/chruby.sh"do
  source "chruby.sh.erb"
end

case node['platform']
when "centos"
  include_recipe "chruby::install_#{node["chruby"]["_DEFAULT_VERSION"]}"
end
