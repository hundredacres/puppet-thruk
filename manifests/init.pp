# == Class: Thruk
#
# This module manages Thruk
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { '::thruk':
#  }
#or
#
#  include ::thruk
#
# === Authors
#
# Author Karen Harutin <karen@inutis.eu
#
#
class thruk {

  include thruk::package
  include thruk::config	
  include thruk::service

  Class['thruk::package'] ->
  Class['thruk::config']  ->
  Class['thruk::service']

}