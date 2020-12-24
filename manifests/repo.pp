# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include thruk::repo
class thruk::repo {
  yumrepo  {'pulp':
    baseurl  => 'https://pulp.inuits.eu/upstream/',
    gpgcheck => '0',
    enabled  => '1',
  }
}
