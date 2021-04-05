#MacOS

## Only friendly names
networksetup -listallnetworkservices

## Useful information
networksetup -listallhardwareports

## Optional but a good start, clear the custom or DHCP DNS
sudo networksetup -setdnsservers Wi-Fi empty

## Statically assign
sudo networksetup -setdnsservers Wi-Fi 127.0.0.1

## Clear DNS Cache
sudo killall -HUP mDNSResponder
