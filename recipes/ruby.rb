git "/home/#{node[:user]}/.rbenv" do
  repository node[:ruby][:rbenv][:repo]
  user node[:user]
end

execute "Add rbenv to bash_profile" do
  user node[:user]
  command "echo 'export PATH=\"/home/#{node[:user]}/.rbenv/bin:$PATH\"' >> ~/.bash_profile;" \
    "echo 'eval \"$(rbenv init -)\"' >> ~/.bash_profile"
  not_if "grep 'rbenv init' ~/.bash_profile"
end

directory "/home/#{node[:user]}/.rbenv/plugins" do
  mode "755"
  owner node[:user]
  group node[:user]
end

node[:ruby][:rbenv][:plugins].each do |plugin|
  git "/home/#{node[:user]}/.rbenv/plugins/#{plugin[:name]}" do
    repository plugin[:repo]
    user node[:user]
  end
end

template "/home/#{node[:user]}/.rbenv/default-gems" do
  mode "644"
  owner node[:user]
  group node[:group]
  source "../templates/rbenv_default_gems.erb"
end

# For SELinux
execute "restorecon /home/#{node[:user]}/.rbenv/default-gems" do
  user node[:user]
  only_if "ls -Z /home/#{node[:user]}/.rbenv/default-gems | grep user_tmp_t"
end

node[:ruby][:versions].each do |version|
  execute "/home/#{node[:user]}/.rbenv/bin/rbenv install #{version}" do
    user node[:user]
    not_if "/home/#{node[:user]}/.rbenv/bin/rbenv versions | grep #{version}"
  end
end

execute "/home/#{node[:user]}/.rbenv/bin/rbenv global #{node[:ruby][:global_version]}" do
  user node[:user]
end