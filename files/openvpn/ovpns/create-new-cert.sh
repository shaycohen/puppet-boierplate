#!/bin/bash

OBASE="/etc/openvpn"
ERSA="$OBASE/easy-rsa/2.0"
KEYS="$ERSA/keys"
CONF="$OBASE/ovpns/$1.ovpn"

cd $ERSA
. vars
./build-key $1 || { 
	echo "ERROR IN CRETING NEW KEY"
	exit 2
}
[[ -s $KEYS/$1.crt ]] || { 
	echo "ERROR IN CREATING NEW CERTIFICATE"
	echo "$KEYS/$1.crt"
	exit 3
}
[[ -e $KEYS/$1.crt ]] || { 
	echo "ERROR IN CREATING NEW CERTIFICATE"
	echo "$KEYS/$1.crt Does not exist"
	exit 4
}

cp $OBASE/client.ovpn.template $CONF
echo '<ca>' >> $CONF
cat $OBASE/ca.crt >> $CONF
echo '</ca>' >> $CONF
echo '<key>' >> $CONF
cat $KEYS/$1.key >> $CONF
echo '</key>' >> $CONF
echo '<cert>' >> $CONF
cat $KEYS/$1.crt >> $CONF
echo '</cert>' >> $CONF
echo ; echo ; echo "####################################################"
echo "New configuration file was created."
echo $CONF
exit 0




