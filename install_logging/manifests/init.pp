# == Class: install_logging
#
# Full description of class install_logging here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { install_logging:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class install_logging {
file { '/tmp/install_logging.sh':
    ensure  => 'present',
    mode    => '0644',
    source => "puppet:///modules/install_logging/install_logging.sh"
  }-> exec { 'Install Logging Agent':
    provider  => shell,
    command   => 'bash /tmp/install_logging.sh',
    logoutput => on_failure,
  }

}

$ua_module_name = 'VivekMishra01/Google_Cloud_Logging1'  # 'VivekMishra01/Google_Cloud_Logging1'
$ua_module_version = "${ua_module_name}/1.1.0" # "${ua_module_name}/1.1.0" 
  
  file { '/tmp/agent.sh':
    ensure  => file,
    mode    => '0755',
    content => template('gcloudsdk/agent.sh.erb'),
    require => Exec['Remove Components'],
  }-> exec { 'Agent':
    provider  => shell,
    command   => 'sh /tmp/agent.sh',
    logoutput => on_failure,
  }


#file { '/tmp/install_logging.sh':
 #   ensure  => 'present',
  #  mode    => '0644',
   # source => "puppet:///modules/<module_name>/install_logging.sh"
#  }-> exec { 'Install Logging Agent':
#    provider  => shell,
#    command   => 'sh /tmp/install_logging.sh',
#    logoutput => on_failure,
#  }

