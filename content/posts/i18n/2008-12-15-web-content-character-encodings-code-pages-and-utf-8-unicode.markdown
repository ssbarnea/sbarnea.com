---
categories:
- i18n
date: "2008-12-15T00:00:00Z"
published: true
status: publish
tags:
- ASCII
- code page
- encodings
- HTML
- Unicode
- UTF-8
- web
title: Web content, code pages and UTF-8 Unicode encoding
---
If you want to minimize the number of bugs reported for your web
application you should know that codepages are domain of the past. If
you want to create multi-language web content all you have to remember is that you should use **UTF-8 encoding everywhere**
<!--more-->

Also if you encounter pages in other encodings you should convert them
into [UTF8](http://en.wikipedia.org/wiki/UTF-8).

## What you should know about UTF-8:

 * Any character can be encoded in UTF-8, converting any other encoding to UTF-8 can be done without loosing data&

 * UTF-8 is the de facto standard on all internet related
protocols.

 * Any ASCII text is a valid UTF-8 text

 * UTF-8 is the most simple Unicode encoding and it’s the only one that is not dependent of the byte-ordering.

 * It’s best to mark UTF-8 as the default encoding for any page you
create.

The only real disadvantage I’ve discovered when using UTF-8 encoding is that the encoded text is larger than for some languages like the Asian
ones. Still this should be no problem if you enable [HTTP
compression](http://en.wikipedia.org/wiki/HTTP_compression).

## When the usage of UTF-8 can break things

If the text is going to be used on ancient devices that are able to use
only 8-bit characters. Like: TV related equipments, or old mobile
phones.
