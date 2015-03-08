execute "cp /usr/share/zoneinfo/Japan /etc/localtime" do
  user "root"
end

template "/etc/sysconfig/clock" do
  mode "644"
  owner "root"
  group "root"
  source "../templates/timezone.erb"
end

# For SELinux
execute "restorecon /etc/sysconfig/clock" do
  user "root"
  only_if "ls -Z /etc/sysconfig/clock | grep user_tmp_t"
end