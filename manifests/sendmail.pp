package {'sendmail': 
	ensure => installed
} ->
service {'sendmail': 
	ensure => running
}
