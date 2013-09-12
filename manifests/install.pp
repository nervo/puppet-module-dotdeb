class dotdeb::install {

    file {
        '/etc/apt/sources.list.d':
            ensure  => 'directory',
            owner   => 'root',
            group   => 'root';

        '/etc/apt/sources.list.d/dotdeb.list':
            ensure  => 'present',
            owner   => 'root',
            group   => 'root',
            mode    => '0600',
            content => template('dotdeb/dotdeb.list.erb'),
            notify  => Exec['update-apt'];
    }

    package { 'wget':
        ensure => present
    }

    exec {
        'dotdeb-apt-key':
            path    => '/bin:/usr/bin',
            command => 'wget http://www.dotdeb.org/dotdeb.gpg -O dotdeb.gpg && cat dotdeb.gpg | apt-key add -',
            unless  => 'apt-key list | grep dotdeb',
            require => [
                File['/etc/apt/sources.list.d/dotdeb.list'],
                Package['wget']
            ],
            notify  => Exec['update-apt'];
    } -> anchor { 'dotdeb::install::end': }

    exec {
        'update-apt':
            path        => '/bin:/usr/bin',
            command     => 'apt-get update',
            require     => Exec['dotdeb-apt-key'],
            refreshonly => true;
    }
}
