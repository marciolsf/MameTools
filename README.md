# MameTools
Collection of powershell scripts related to mame maintenance

I was having a hard time locating good clean up tools, so I wrote my own! So far I have the following:

* RemoveFiles.ps1 -- This script will remove mature files, as listed in mature.ini (itself a copy from https://github.com/mamesupport/catver.ini, which I don't own or maintain)
* testRoms.ps1 -- This script will test roms from an existing directory, and move every non-working rom to another directory