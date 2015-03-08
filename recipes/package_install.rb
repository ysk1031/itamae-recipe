%w(
  gcc gcc-c++ readline-devel git ImageMagick ImageMagick-devel openssl-devel epel-release
  mysql-server mysql-devel libxml2-devel libxslt-devel
).each do |pkg|
  package pkg
end