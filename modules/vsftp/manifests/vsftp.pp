class vsftp {
  package { "vsftpd":
	ensure => installed
  }

  service { "vsftpd":
	ensure => running
  }
}
