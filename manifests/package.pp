#install Thruk package.
#
#
#    ATTENTION!!! If you have pulp.inuits.eu/upstream/ already activated, the yumrepo['pulp'] is not necessary.
#
class thruk::package {

  yumrepo  {'pulp':
    baseurl  => 'https://pulp.inuits.eu/upstream/',
    gpgcheck => '0',
    enabled  => '1',
  }

  package { $thruk::params::packageCommon:
    require =>Yumrepo['pulp'],
  }

}