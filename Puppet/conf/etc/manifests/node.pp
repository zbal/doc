#
# Define nodes on the system
#

# Test node - basic nginx installed
#node default {
node /^puppet-client\d+.balou.local/ {
  include common
}

class common {
  Exec { path => '/usr/bin:/bin:/usr/sbin:/sbin' }
  package { [ 'nginx', 'php5-fpm','htop' ] :
    ensure => present,
  }

  service { [ 'nginx', 'php5-fpm' ] :
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
  }

  file { '/etc/apt/sources.list':
    source => 'puppet:///files/etc-apt-sources.list',
    ensure => present,
  }

  exec { "apt-get update": 
    subscribe => File['/etc/apt/sources.list'],
    refreshonly => true,
  }
}


#  package { 'htop' :
#    ensure => present,
#  }

#notify { "This message is getting logged on the agent node.": }
