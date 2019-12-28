---
categories:
- i18n
date: "2009-01-17T00:00:00Z"
tags:
- mistakes
- standards
title: 'i18n mistake #1: Using images for representing languages'
slug: i18n-mistake-flags-for-languages
---
Clearly adding images for representing languages is not the most important internationalization issue someone can make. In fact I added #1 because this is the first internationalization mistake I decided to blog about and I want to document many more mistakes in the future.
<!--more-->

As a quick solution would be to use images with [ISO 639-1](http://en.wikipedia.org/wiki/ISO_639-1) language codes like: ``en``, ``fr``, ``de``, ``es``, ``ja``. But you should be aware that not all languages can be represented using ``ISO 639-1`` and you may be required to use ``ISO-639-3`` or simpler to add a two-letter subcode using country code [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166)  like ``en-us`` or ``en-gb``.

Also check the list every time you add a language because it's **another common mistake to assume that two letter domain names or country codes are the same as the language codes**.

An even a better idea could be to not use images at all :D

You may find additional resources at:

* [sil.org](http://www.sil.org/iso639-3/codes.asp?order=639_1)
