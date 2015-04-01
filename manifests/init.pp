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
class thruk (

  $peer_name      = $thruk::params::peer_name,
  $peer_type      = $thruk::params::peer_type,
  $peer_path      = $thruk::params::peer_path,
  $core_conf      = $thruk::params::core_conf,
  $obj_check_cmd  = $thruk::params::obj_check_cmd,
  $obj_reload_cmd = $thruk::params::obj_reload_cmd,

) inherits thruk::params {

  if $thruk::params::linux {

  include thruk::package
  include thruk::config
  include thruk::mod_fcgid
  include thruk::service

  Class['thruk::mod_fcgid'] ->
  Class['thruk::package']   ->
  Class['thruk::config']    ->
  Class['thruk::service']

  }
}