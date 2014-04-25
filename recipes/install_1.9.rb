execute "apt-get update" do
  ignore_failure true
  action :nothing
end.run_action(:run) if node['platform'] == "ubuntu"

execute "ruby-install ruby 1.9" do
        command "/usr/local/bin/ruby-install ruby 1.9"
end
