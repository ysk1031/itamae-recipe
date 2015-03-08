directory "/home/#{node[:user]}/.aws" do
  mode "755"
  owner node[:user]
  group node[:group]
end

remote_file "/home/#{node[:user]}/.aws/credentials" do
  mode "600"
  owner node[:user]
  group node[:group]
  source "~/.aws/credentials"
end

# For SELinux
execute "restorecon /home/.aws/credentials" do
  user node[:user]
  only_if "ls -Z /home/.aws/credentials | grep user_tmp_t"
end