exec { "apt-update":
  command => "/usr/bin/apt-get update"
}

package {[
    "php7.0",
    "php-pear",
    "php7.0-curl",
    "php7.0-gd",
    "php7.0-intl",
    "php7.0-xmlrpc",
    "php7.0-mysql",
    "apache2",
    "python-mysqldb",
    "wget",
    "curl",
    "vim",
  ]:
  ensure => installed,
  require => Exec["apt-update"],
}

file { '/etc/apache2/conf-available/direxpress.conf':
  ensure => present,
  owner => root,
  group => root,
  mode => '0664',
  replace => true,
  content => template('/vagrant/manifests/direxpress.conf'),
  require => Package["apache2"],
#  notify => Service['apache2'],
}

file { "/etc/apache2/sites-available/express.conf":
  nsure => present,
  owner => root,
  group => root,
  mode => '0664',
  replace => true,
  content => template("/vagrant/manifests/express.conf"),
  require => Package["apache2"],
#  notify => Service['apache2'],
}