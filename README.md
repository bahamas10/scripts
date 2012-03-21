Scripts
=======
A handful of scripts I've written.

Geo IP
------
Get geoip information given a URL or IP.

    dave @ [ lifeforce :: (Linux) ] ~/dev/scripts $ ./geoip daveeddy.com
    ----- daveeddy.com -----
    Host Name: 212.38.176.176
    IP Address: 212.38.176.176
    Country: United States
    Country code: US (USA)
    Region:
    City:
    Postal code:
    Calling code: +1
    Longitude: -97
    Latitude: 38

HD Size
-------
Print df -h and look for mounts over a given percentage used (default 90%).

    dave @ [ lifeforce :: (Linux) ] ~/dev/scripts $ ./hdsize 29
    Filesystem            Size  Used Avail Use% Mounted on
    /dev/sda6             395G  112G  263G  30% /
    none                  7.9G  680K  7.9G   1% /dev
    none                  7.9G  192K  7.9G   1% /dev/shm
    none                  7.9G  124K  7.9G   1% /var/run
    none                  7.9G     0  7.9G   0% /var/lock
    tmpfs                 7.9G  212M  7.7G   3% /mnt/chrome-cache
    /dev/sda6 (/) 30%

LOST Prompt
-----------
Display the prompt from the show lost, you must enter the right code to get out.

Random MAC
----------
Print a random mac address with optional prefix.

    dave @ [ lifeforce :: (Linux) ] ~/dev/scripts $ ./randommac
    54:52:00:D5:26:14
    dave @ [ lifeforce :: (Linux) ] ~/dev/scripts $ ./randommac 00:11:22
    00:11:22:22:24:26

RSS
---
Parse an rss feed url using php.

    dave @ [ lifeforce :: (Linux) ] ~/dev/scripts $ ./rss http://daveeddy.com/feed
    Dave Eddy
    >> Manpage Resume (1 ago)
    >> Acer Aspire One + Xubuntu (1 ago)
    >> Scripts Repo (1 ago)
    >> Github Account (2 ago)
    >> Puppet Management (5 ago)

Shoutcast
---------
Screenscrape di.fm for a list of stations, and open one of them in your music player (xdg-open).


Copying
=======
Released under the BSD 3-clause license, see LICENSE for details.
