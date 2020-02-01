---
categories:
- i18n
date: "2010-08-12T00:00:00Z"
published: true
status: publish
tags:
- encodings
- internationalization
- Unicode
title: Newbie guide to Unicode
---
I compiled a small list of things that any developer should know about Unicode.<!--more-->

*   **Unicode can represent any characters** – Yes, at least for the usual mortals :D
*   **Same text can have different representations on Unicode** - This is sad especially if you want to implement passwords or search Unicode text.
*   **Microsoft wrongly calls their UTF16-BE Unicode encoding just Unicode** - Just remember that Unicode strings under windows (wchar *) are using ``UTF16-BE``. - Also remember that the support for ``UTF-8`` is limited under Window. You cannot use ``UTF-8`` as a codepage on console or GUI applications so the only Unicode way is to use ``UTF16-BE``. This does not mean that you cannot use it internally but when it comes to calling APIs or outputting to console you will be forced to convert it.
*   **Unicode is not an encoding or a code page** - Unicode is a **character-set**, that can be encoded using one of the 4/6 existing Unicode encodings:

    *   ``UTF-7`` – probably you can ignore its existence
    *   ``UTF-8`` – The one that I prefer considering:

        *   standard for most internet related protocols and becoming more popular
        *   minimize required storing space for most languages, except [CJK](http://en.wikipedia.org/wiki/CJK_characters) ones.
        *   default storage encoding on Unix/Linux world (in memory they usually use ``UTF-32`` to speedup processing)
        *   does have only one binary representation

    *   ``UTF-16`` – what Windows, OS X and Java are using internally. It comes in two variants LE and BE based on [endianness](http://en.wikipedia.org/wiki/Endianness) of the platform. Usage of this encoding is a good compromise between speed and space but when it comes to disk storage or communication UTF-8 could be better because it does not depends on the endianness.
    *   ``UTF-32`` (also having BE/LE flavors based on the endianness) – good for processing speed but not for storage.

*   Do not try to do more Unicode text processing yourself (at least not more than concatenations). You should use what your platform provides you or the [ICU](http://site.icu-project.org/) do to do other processing like comparison, sorting, searching or replacing text because these operations are very tricky and probably you have better things to do.
*   <div>Remember than in Unicode:</div>

    *   two semantically identically strings can have a different binary representation even on the same encoding
    *   sorting is dependent on user context (locale) and not only the strings being sorted
    *   regarding uppercase/lowercase read [http://www.unicode.org/faq/casemap_charprop.html](http://www.unicode.org/faq/casemap_charprop.html)

## Additional resources

These are few resources that you should read if you are new to Unicode:

*   [http://unicode.org/standard/WhatIsUnicode.html](http://unicode.org/standard/WhatIsUnicode.html)
*   [http://www.unicode.org/faq/](http://www.unicode.org/faq/)
*   [http://msdn.microsoft.com/en-us/library/dd374081(VS.85).aspx](http://msdn.microsoft.com/en-us/library/dd374081(VS.85).aspx)
*   [http://www.egenix.com/www2002/python/Unicode-EPC2002-Talk.pdf](http://www.egenix.com/www2002/python/Unicode-EPC2002-Talk.pdf)
