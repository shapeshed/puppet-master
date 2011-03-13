class ntp {
  package { "ntp":
	ensure => installed
  }

  service { "ntp":
	ensure => running
  }
}
