---
categories:
- i18n
date: "2008-09-17T00:00:00Z"
published: true
status: publish
tags: []
title: Better localization for filenames on Windows, OS X and Linux
---
If you have a localized application, at some stage you'll discover that **you need to localize filenames** - for example if you have a set of template files. This is quite a tricky problem because it's very hard to maintain a list of localized files and you can't use diff tools for comparing them because they have different names. It's a good idea to keep the filenames not localized but to "localize" them on-the-fly - only when you show them to the user.

### Why? ###

*   It's simpler to have the same filenames for all files and will generate **less bugs** inside code.
*   You'll have **less Unicode related problems** with the transfer of the files on FTP or filesystems not supporting unicode.
*   It's the only way you can have a **multi-language** application or operating system, think that many people using different languages can access the same computer, even at the same moment - like Terminal Server.

## Apple OS X ##
On OS X you can use ``.localized`` extension for setting the names that are going to be shown to the used. You can find a good description of how does OS X handle localized files on DisplayNames article on Apple site.

Localized directory and files names appear only if the “Show all file extensions” option is not selected in the Finder preferences - you need to login again after changing this.

## Microsoft Windows Vista

You can customize the names of the folders and files using `desktop.ini` files. There is a small glitch with this, you have to Reset Icon Cache after a change because the OS is caching the names and the icons. You can find several ways of doing that at http://smallvoid.com//article/windows-icon-cache.html

First parameter is a the full path to the a binary file (EXE or DLL) containing the localized string resources. The second parameter is the resource ID, Windows will know to load the correct language from the resources.

```ini
[.ShellClassInfo]
LocalizedResourceName=@%SystemRoot%system32shell32.dll,-21813
[LocalizedFileNames]
first.txt=@%SystemRoot%system32shell32.dll,-12712
next.txt=@%SystemRoot%system32shell32.dll,-21813
```

Use this script for forcing update of the texts.

```batch
@echo off
:: xp
del 	/F "%HOMEPATH%Local SettingsApplication DataIconCache.db"
:: vista
del /F "%USERPROFILE%AppDataLocalIconcache.db"

taskkill /f /IM explorer.exe

start explorer.exe
```

## Microsoft Windows XP ##

You document to the users that they are going to see localized filenames only on Windows Vista because Windows XP doesn't support this.

## Linux ##

I've found **no support** for this right now. The only thing i've discovered in Ubuntu 8.04 is that you can change the GUI language and, after login, you'll be prompted to rename Standard Folders (Like Documents, Music, ...) to the new translated  names - but it does not move the directories.
