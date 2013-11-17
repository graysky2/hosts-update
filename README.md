# hosts-update
Updates /etc/hosts with the mvps blocklist to prevent thousands of parasites, hijackers and unwanted adware/spyware/privacy websites from working.  Note that this script works under both GNU Linux and BSD/OSX.

1. Edit /etc/hosts.local to match the hostname of your system and adjust the domainname as needed.  Also add any hosts that you wish to keep i.e. other PCs on your network.

2. Run the script as root which will append /etc/hosts.local to the mvps blocklist and apply some post processing writing the final file to /etc/hosts automatically.

3. (Optional) Add a cronjob under root crontab at some interval to keep your /etc/hosts fresh.

## Dependencies
Nearly all of the utils called by this script should be part of any respectable distro.  The only exception might be curl which is not installed by default on several minimal distros.

## Links
AUR package: https://aur.archlinux.org/packages/hosts-update
