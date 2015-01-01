package {'openvpn':
	ensure => present
} ->
file {'/etc/openvpn':
	ensure => present,
	source => '/etc/puppet/files/openvpn',
	recurse => true
} ->
service {'openvpn':
	ensure => running
}
