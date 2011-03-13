class motd {
  file { "/etc/motd" :
    mode => 444,
    content => template("motd/motd.erb")
  }
}
