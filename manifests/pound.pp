package {'pound':
	ensure => installed
} ->
file {'pound.cfg':
	path => '/etc/pound/pound.cfg',
	source => '/etc/puppet/files/pound/pound.cfg'
} ->
file {'wiki.opensourceinc.com.pem':
	path => '/etc/pound/wiki.opensourceinc.com.pem',
	source => '/etc/puppet/files/pound/wiki.opensourceinc.com.pem'
} ->
user {'www-data':
	ensure => present
} ->
file {'default/pound':
	path => '/etc/default/pound',
	content => 'startup=1'
} ->
service {'pound':
	ensure => running
}
