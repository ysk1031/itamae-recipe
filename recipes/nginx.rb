package "nginx"

service "nginx" do
  action %i(enable start)
end

# template "/etc/nginx/nginx.conf" do
#   mode "644"
#   owner "root"
#   group "root"
#   source "../templates/nginx.conf.erb"
# end
#
# # For SELinux
# execute "restorecon /etc/nginx/nginx.conf" do
#   user "root"
#   only_if "ls -Z /etc/nginx/nginx.conf | grep user_tmp_t"
# end

execute "chmod 755 /var/log/nginx" do
  user "root"
end

execute "chown -R #{node[:user]}:#{node[:group]} /var/lib/nginx" do
  user "root"
  not_if "ls /var/lib/nginx | grep '#{node[:user]} #{node[:group]}'"
end

execute "chmod -R 755 /var/lib/nginx/tmp" do
  user "root"
end

service "nginx" do
  action :reload
end