# Class: rkhunter::params
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
class thruk::params {
  # Operating system specific definitions
  case $::osfamily {
    'RedHat' : {
      $linux = true

      # Package definition
      $packageCommon = 'thruk'

      # Config definition
      $configThrukConf = '/etc/thruk/thruk.conf'
      $configThrukConfTemplate = 'thruk/etc/thruk.conf.erb'
    }
    default  : {
      $linux = false
    }
  }
}
