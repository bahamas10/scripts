Scripts
=======

A handful of scripts I've written.

SmartOS memusage
----------------

Show memory usage for SmartOS Zones

dave @ [ nexus :: (SunOS) ] ~ # /opt/memusage.sh
        ALIAS   MEMORY (mb)                             UUID
       global    92.8398mb / 1.75922e+13mb             -
           go    46.1484mb / 256mb                     00105c11-fed4-413c-bfac-2da4b9d55667
       gvoice    43.9414mb / 256mb                     2eab3d6a-7287-41c4-b93e-6b7fac718c47
     overmind    34.9375mb / 256mb                     b846e24d-734d-4ec5-bded-b57737f453e2
          ns1    76.9727mb / 256mb                     ca675904-50c8-470d-89e6-63c97d41df3f
      arbiter    116.551mb / 512mb                     9d4f2dba-583f-4d26-9910-9c455ec0b90a
       skyevm    364.352mb / 1024mb                    081ae139-a6df-4dfe-b500-cf1eed7479e5
     porthose     456.75mb / 1024mb                    d0627c90-f603-4467-8f34-37a97f97d078


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

HDD Temps
---------

Get temperature readouts for harddrives (tested on OpenIndiana)

    dave @ [ datadyne :: (SunOS) ] ~ $ ./hdd-temps
    /dev/rdsk/c3d0s0 :: No temperature found
    /dev/rdsk/c2t0d0s0 :: 26°C (78.8°F)
    /dev/rdsk/c2t1d0s0 :: 26°C (78.8°F)
    /dev/rdsk/c2t2d0s0 :: 26°C (78.8°F)
    /dev/rdsk/c2t3d0s0 :: 24°C (75.2°F)
    /dev/rdsk/c2t4d0s0 :: 25°C (77.0°F)
    /dev/rdsk/c2t5d0s0 :: 26°C (78.8°F)
    /dev/rdsk/c2t6d0s0 :: 27°C (80.6°F)
    /dev/rdsk/c2t7d0s0 :: 26°C (78.8°F)

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

Copying
=======

Released under the BSD 3-clause license, see LICENSE for details.
