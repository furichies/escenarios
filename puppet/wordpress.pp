node 'puppetnode1', 'puppetserver' {
  class { 'mysql::server':
    package_name => 'mariadb-server',
    service_name => 'mariadb',
    root_password => '', # Reemplaza con la contraseña adecuada ... si quieres XD
  }

  mysql::db { 'wordpress':
    user     => 'wordpressuser',
    password => 'CaM1n0K0y0T3',
    host     => 'localhost',
    grant    => ['ALL'],
    require  => Class['mysql::server'],
  }

  package { 'apache2':
    ensure => installed,
  }

  service { 'apache2':
    ensure => running,
    enable => true,
  }

  package { 'php':
    ensure => installed,
  }

  package { 'php-mysql':
    ensure => installed,
  }

  exec { 'download-wordpress':
    command => '/usr/bin/wget -P /var/www/html https://wordpress.org/latest.tar.gz',
    creates => '/var/www/html/latest.tar.gz',
  }

  exec { 'extract-wordpress':
    command => '/usr/bin/tar -xzf /var/www/html/latest.tar.gz -C /var/www/html',
    cwd     => '/var/www/html',
    creates => '/var/www/html/wordpress',
    require => Exec['download-wordpress'],
  }

  file { '/var/www/html/wp-config.php':
    ensure  => present,
    content => template('/vagrant/wordpress/wp-config.php.erb'),
    require => Exec['extract-wordpress'],
  }

  file { '/etc/apache2/sites-available/wordpress.conf':
    ensure  => present,
    content => template('/vagrant/wordpress/wordpress.conf.erb'),
    require => File['/var/www/html/wp-config.php'],
    notify  => Exec['enable-wordpress-site'],
  }

  file { '/etc/apache2/sites-enabled/wordpress.conf':
    ensure => link,
    target => '/etc/apache2/sites-available/wordpress.conf',
    require => File['/etc/apache2/sites-available/wordpress.conf'],
    notify => Exec['reload-apache2'],
  }

  exec { 'enable-wordpress-site':
    command => '/usr/sbin/a2ensite wordpress.conf',
    refreshonly => true,
    require => File['/etc/apache2/sites-available/wordpress.conf'],
  }

  exec { 'reload-apache2':
    command => '/usr/sbin/service apache2 reload',
    refreshonly => true,
    subscribe => File['/etc/apache2/sites-enabled/wordpress.conf'],
    require => Exec['enable-wordpress-site'],
  }
}
