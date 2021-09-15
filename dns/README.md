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

## Install

- <https://github.com/DNSCrypt/dnscrypt-proxy/wiki/Installation-macOS>
- <https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/2.1.0/dnscrypt-proxy-macos_x86_64-2.1.0.zip>

```sh
sudo -s

# Copy service's defs
cp dnscrypt-proxy\*.plist /Library/LaunchDaemons

# Symlink config
cd /opt/dnscrypt-proxy
ln -s $DOTFILES/dns/dnscrypt-proxy.toml

# Symlink blocklist updater and run it to get the list
ln -s $DOTFILES/dns/update-blocklist
/opt/dnscrypt-proxy/update-blocklist

# Load services and start
launchctl load /Library/LaunchDaemons/dnscrypt-proxy-blocklist.plist
launchctl load /Library/LaunchDaemons/dnscrypt-proxy.plist
launchctl start dnscrypt-proxy-blocklist
launchctl start dnscrypt-proxy

networksetup -setdnsservers Wi-Fi empty
networksetup -setdnsservers Wi-Fi 127.0.0.1
killall -HUP mDNSResponder
```
