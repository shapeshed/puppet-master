class passenger {
  package { "passenger":
	ensure => installed,
	provider => gem
  }
}
