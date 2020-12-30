# Class: thruk::params
#
# This module contain the parameters for rkhunter
#
# Parameters:   This module has no parameters
#
# Actions:      This module has no actions
#
# Requires:     This module has no requirements
#
# Sample Usage: include thruk::params
#
class thruk::params(
  $peer_name       = 'Icinga',
  $peer_type       = 'livestatus',
  $peer_path       = 'localhost:6557',
  $core_conf       = '/etc/icinga/icinga.cfg',
  $obj_check_cmd   = '/etc/init.d/icinga configcheck',
  $obj_reload_cmd  = '/etc/init.d/icinga reload',
  $default_admin   = true,
  $thrukadmin_user = '',
  $thrukadmin_pass = '',
){
  # Operating system specific definitions
  case $::osfamily {
    'RedHat' : {
      $linux = true

      # Package definition
      $packagecommon = 'thruk'

      # Config definition
      $configthrukconf = '/etc/thruk/thruk.conf'
      $configthrukconftemplate = 'thruk/etc/thruk.conf.erb'
      $htpasswd_file = '/etc/thruk/htpasswd'
    }
    default  : {
      $linux = false
    }
  }
}
