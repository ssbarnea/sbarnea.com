---
categories:
- i18n
date: "2011-02-08T00:00:00Z"
published: true
status: publish
tags:
- i18n
title: Microsoft Office spellchecker failing to detect language
---
I was surprised to find out that Microsoft Office spellchecker is failing to detect the language even if this is damn simple because it should be based on the keyboard language set on the system.
<!--more-->
Take a look at my configuration below, it is supposed to spellcheck in English when you are in “EN” mode but instead it always using Romanian.

Worse, even if you try to disable the auto language detection and set the default to English it will still use Romanian. Sad, probably this is happening when you do the QA without people specially trained for internationalization.

<!-- ![x](http://sbarnea.com/wp-content/uploads/2011/02/020811_0649_MicrosoftOf1.png) -->
