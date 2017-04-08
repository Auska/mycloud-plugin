1
# Note
2
​
3
ARM, MIPS and x86 forks of Entware was merged into [Entware-ng](https://github.com/Entware-ng/Entware-ng). Further development of this project will be continued there. Please, don't add any new issues or pull requests here.
4
​
5
# Description
6
​
7
Entware is package repository for embedded devices. [These packages](http://old.entware.net/binaries/entware/Packages.html) allow you to add new functionality to your device. Most of them taken from OpenWRT, but others are unique. It's usable by router firmwares such as DD-WRT/Tomato/AsusWRT, by Realtek RTD1073/1283/1185/1186 based players, and so on. 
8
​
9
# Getting started
10
​
11
[Prepare USB drive](https://github.com/Entware/entware/wiki/USB-Storage-setup), or other storage, and type:
12
​
13
Soft-float ( Works with both soft-float & hard-float firmwares. )
14
```
15
wget -O - http://old.entware.net/binaries/mipselsf/installer/entware_install.sh | sh
16
```
17
Hard-float ( Works only with hard-float firmwares. )
18
```
19
wget -O - http://old.entware.net/binaries/entware/installer/entware_install.sh | sh
20
```
21
A basic packages will be deployed. See [available packages](http://old.entware.net/binaries/entware/Packages.html):
22
```
23
opkg list
24
```
25
Install desired ones:
26
```
27
opkg install mc
28
```
29
See other OPKG commands [here](http://wiki.openwrt.org/doc/techref/opkg).
30
​
31
# Getting more help
32
​
33
* See (and fill) [Wiki pages](https://github.com/Entware/entware/wiki/_pages),
34
* Ask new packages or report about bugs on [Issues](https://github.com/Entware/entware/issues),
35
* Discuss Entware on http://wl500g.info/forum.php.
36
​