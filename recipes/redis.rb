package "redis" do
  options "--enablerepo=epel"
end

service "redis" do
  action %i(enable start)
end