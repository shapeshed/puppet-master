node puppetclient {

	package { "apt":
		ensure => installed,
	}

	file{"/etc/apt/sources.list":
		ensure => present,
		owner  => root,
		require => Package["apt"]
	}

	file{"/var/run/motd":
		source => "puppet:///files/motd"
	}
}
