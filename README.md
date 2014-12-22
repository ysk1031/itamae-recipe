itamae-recipe
=============

Recipes for Itamae

## Recipe (for Vagrant)
### (VM setting)
Create VM environment (CentOS 6.6).

```
$ vagrant box add opscode-centos-6.6 http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.6_chef-provisionerless.box
$ cd /path/to/itamae-recipe
$ vagrant init opscode-centos-6.6
$ vagrant up
```

### Install Ruby via rbenv
```
$ itamae ssh -h default --vagrant --node-json node.json recipes/ruby-env.rb
```
