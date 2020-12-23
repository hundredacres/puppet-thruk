#
#   ATTENTION!!! If you have EPEL already activated, the yumrepo['mod_epel'] is not necessary.
#
class thruk::mod_fcgid {
  #yumrepo  {'mod_epel':
  #  baseurl  => 'http://download.fedoraproject.org/pub/epel/6/$basearch',
  #  gpgcheck => '0',
  #  enabled  => '1',
  #}

  package {'mod_fcgid':
    ensure   => present,
    #require => Yumrepo['mod_epel'],
  }
}
