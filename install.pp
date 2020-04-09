exec {"apt-update":
  command => '/usr/bin/apt-get update'
}

package {[
    "tree",
]:
 ensure => installed,
 require => Exec["apt-update"],
}