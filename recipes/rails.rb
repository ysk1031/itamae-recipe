# For nokogiri
execute "/home/#{node[:user]}/.rbenv/shims/gem install nokogiri -- --use-system-libraries" do
  user node[:user]
  not_if "gem list | grep nokogiri"
end

execute "/home/#{node[:user]}/.rbenv/shims/bundle config build.nokogiri --use-system-libraries" do
  user node[:user]
  not_if "grep 'BUNDLE_BUILD__NOKOGIRI: \"--use-system-libraries\"' /home/#{node[:user]}/.bundle/config"
end

execute "/home/#{node[:user]}/.rbenv/shims/gem install rails" do
  user node[:user]
  not_if "rails -v | grep Rails"
end