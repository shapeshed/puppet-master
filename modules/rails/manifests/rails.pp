class rails {

	package { "ruby":
		ensure => installed
	}

	package { "rails":
		ensure => installed,
		provider => "gem",
		require => Package["rubygems"]
	}
}
