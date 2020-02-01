---
categories:
- i18n
date: "2008-12-07T00:00:00Z"
published: true
status: publish
tags: []
title: Automation and Unicode text input under Windows
---
If you'll ever try to use automation for testing globalization readiness on applications you are going to discover that the [keyboard input API](http://msdn.microsoft.com/en-us/library/ms645530(VS.85).aspx) does not have any function for entering Unicode texts. If you'll try to use [VkKeyScan](http://msdn.microsoft.com/en-us/library/ms646329(VS.85).aspx) for converting an Unicode character to a virtual key - in order to map it to a keystroke - you'll discover that the Windows Keyboard Input API will return you nothing because current keyboard layout is not able to produce the requested character.

You could the clipboard for inserting Unicode text but be aware that thin method does not enable you to test real keyboard input. If you are not using standard windows controls you have to test quite a few different keyboard layouts.
