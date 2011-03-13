class postgres {
  package { "postgresql":
	ensure => installed
  }

  service { "postgresql":
	ensure => running
  }
}
