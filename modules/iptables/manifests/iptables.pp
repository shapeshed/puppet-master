class iptables($ssh_port = 22) {

  package { "iptables":
	ensure => installed
  }
  file { "/root/bin":
	ensure => directory,
	recurse => true,
	owner => "root",
	group => "root",
	mode => 0644
  }


  file { "/root/bin/firewall.sh" :
	ensure => present,
	recurse => true,
    	mode => 0644,
	owner => "root",
	group => "root",
    	content => template("iptables/firewall.sh.erb")
  }

  exec { "run-firewall":
    	command => "/bin/bash firewall.sh",
    	cwd => "/root/bin",
	subscribe => File["/root/bin/firewall.sh"],
	refreshonly => true
  }
}
