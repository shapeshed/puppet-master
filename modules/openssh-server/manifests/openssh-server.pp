class openssh-server($ssh_port = 22) {
  package { "openssh-server":
	ensure => installed
  }

  file { "/etc/ssh/sshd_config" :
	mode => 444,
	content => template("openssh-server/sshd_config.erb")
  }
  service { "ssh":
	ensure => running,
	subscribe => file["/etc/ssh/sshd_config"]
  }

}
