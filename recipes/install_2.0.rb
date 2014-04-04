execute "apt-get update" do
  ignore_failure true
  action :nothing
end.run_action(:run) if node['platform'] == "ubuntu"

execute "ruby-install ruby 2.0" do
        command "ruby-install ruby 2.0"
end
