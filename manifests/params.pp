# == Class mono_core::params
#
# This class is meant to be called from mono_core
# It sets variables according to platform.
#
class mono_core::params {
  case $::osfamily {
    'redhat': {
      case $::operatingsystem {
        CentOS: {
          case $::operatingsystemmajrelease {
            6: { $required_repos = 'epel' }
            7: { $required_repos = 'epel' }
            default: {
              $required_repos = ''
              fail("${::operatingsystem} version ${::operatingsystemmajrelease} not supported")
            }
          }
        }
        default: { 
          $required_repos = ''
          fail("${::operatingsystem} not supported")
        }
      }
    }
    default: { 
      $required_repos = ''
      fail("${::osfamily} not supported")
    }
  }
}
