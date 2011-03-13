class user {
  include ssh::auth
  define add_user($email, $uid){
	$username = $title
	user { $username:
                    comment => "$email",
                    home    => "/home/$username",
                    shell   => "/bin/bash",
                    uid     => $uid
            }

            group { $username:
                    gid     => $uid,
                    require => user[$username]
            }

            file { "/home/$username/":
                    ensure  => directory,
                    owner   => $username,
                    group   => $username,
                    mode    => 750,
                    require => [ user[$username], group[$username] ]
            }

            file { "/home/$username/.ssh":
                    ensure  => directory,
                    owner   => $username,
                    group   => $username,
                    mode    => 700,
                    require => file["/home/$username/"]
            }
  }
}
