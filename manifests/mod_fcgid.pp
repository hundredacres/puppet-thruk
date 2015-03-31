class thruk::mod_fcgid {
  yumrepo  {'mod_epel':
    baseurl  => 'http://download.fedoraproject.org/pub/epel/6/$basearch',
    gpgcheck => '0',
    enabled  => '1',
  }

  package {'mod_fcgid':
    require =>Yumrepo['mod_epel'],
  }
}