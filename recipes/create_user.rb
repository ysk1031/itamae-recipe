user "create node[:user] user" do
  uid 1000
  username node[:user]
  password "eijfoan1vo31erag1oiagj"
end

directory "/home/#{node[:user]}/.ssh" do
  mode "700"
  owner node[:user]
  group node[:group]
end

remote_file "/home/#{node[:user]}/.ssh/authorized_keys" do
  owner node[:user]
  group node[:group]
  source "~/.ssh/id_rsa.pub"
end

execute "chmod 600 /home/#{node[:user]}/.ssh/authorized_keys" do
  user node[:user]
end