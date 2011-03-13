class rvm {

  Package {
    'git':
      ensure => present;
  }

  file {
    '/etc/profile.d/rvm.sh':
      source  => 'puppet:///modules/rvm/rvm.profile';
  }

  exec {
    'rvm': 
      command => 'bash < <(curl -L http://bit.ly/rvm-install-system-wide)',
      creates => '/usr/local/bin/rvm';
  }

}

class rvm::1_9_2 inherits rvm {
  
  exec {
    'install':
      command => '[[ $(rvm list) =~ 1.9.2 ]] || rvm install 1.9.2';
  }
  
  Exec['rvm'] -> Exec['install']
  
}

