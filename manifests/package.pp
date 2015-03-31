#install Thruk package.
class thruk::package {

  yumrepo  {'thruk':
    baseurl  => 'https://pulp.inuits.eu/upstream/',
    gpgcheck => '0',
    enabled  => '1',
  }

  package { $thruk::params::packageCommon:
    require =>Yumrepo['thruk'],
  }

}