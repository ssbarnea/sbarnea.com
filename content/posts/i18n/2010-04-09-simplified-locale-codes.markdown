---
categories:
- i18n
date: "2010-04-09T00:00:00Z"
published: true
status: publish
tags:
- i18n
- language
- standards
title: Using the simple language and locale codes
---

If you localize only for the macro-language use the macro language code. If you have only one English use just "en" code but if you have more than one "en" will mean "en-US" and you will have to add more detailed codes and like "en-CA".<!--more--> Unicode website gives more details in [picking the right language code](http://cldr.unicode.org/index/cldr-spec/picking-the-right-language-code) article.


The table below shows language codes that I would recommend you to use. The principle is simple: use the simplest code that does not generate confusion. For languages not listed here it is safe to consult [this article](http://cldr.unicode.org/index/cldr-spec/picking-the-right-language-code). If you have questions please email me, I will investigate and complete the below table with other cases.

Language | Recommended code | Explanation | Other valid codes
--- | --- | --- | ---
Chinese (Simplified) | zh | This is a macrolanguage. It does map to Chinese (Simplified) language (sometimes referred as Mandarin) because this is the predominant language. [ref1](https://meta.wikimedia.org/wiki/Automatic_conversion_between_simplified_and_traditional_Chinese) | zh-hans, zh-cn, zh-sg, zh-hant-cn, zh-hant-sg
Chinese (Traditional) | zh-hant | It is a good idea not to specify the region because there are several regions where Traditional Chinese is present so specifying only the script is better. | zh-hant, zh-tw, zh-hk, zh-mo, zh-hant-tw, zh-hant-hk, zh-hant-mo
English (US) | en | You should use this code if you have only one English translation or if this is American English. American English is the predominant language so the "en" code will auto-map to en-us. | en-us
English (UK) | en-gb | en-uk (just for compatibility) | |
Portuguese (Brazilian) _generic_ | pt | Use pt instead of pt-br to enable easy fallback when you do not have a **pt-pt **translation. | pt-br

Portuguese (Portugal) | pt-pt | Do not use just "pt" if you have translations for both Brazilian Portuguese and Portugal Portuguesse. | |
Romanian | ro | Romanian has a ISO 639-1 code and there no need to use a more complex code like ones specified in 639-2 or 639-3 | ro-ro, ro-latn-ro

Spanish (Spain) | es | es-es is considered the predominant language. | es-es |
French (France) | fr | fr-fr is considered the macro-languages. | fr-fr |

For most languages it will be safe to use the two letters code, this will work without problems for Arabic (**ar**), Czech (**cs**), Danish (**da**), German (**de**), Greek (**el**), Finnish (**fi**), Hebrew (**he**), Hungarian (**hu**), Italian (**it**), Japanese (**ja**), Korean (**ko**), Norwegian (**nb**), Dutch (**nl**), Polish (**p**l), Romanian (**ro**), Russian (**ru**), Swedish (**sv**), Turkish (**tr**), Ukrainian (**uk**).

## Matching languages codes

You have an application localized in a number of languages and the system (OS or browser) is reporting you one or more language codes that do not exactly match your list. How do you make an optimal selection for this?

I think that it would be wise to reuse the same language tags from HTML specification.

In case you are doing a browser application you will get a more detailed information ([see RFC2616](https://www.w3.org/Protocols/rfc2616/rfc2616.html)) about language preferences of the user: "en, es, de, ja, zh-TW" or even with preference factor (0.0-1.0) ``"en, es;q=0.8, de;q=0.7, ja;q=0.3, zh-TW;q=0.1"``

So the only remaining problem is that you need to make a proper matching between what you have and what the system reports. The matching is not very simple because usually you don't know the exact form reported by the system. Codes like "zh-TW" should map to "zh-hant" and "zh-CN" or "zh-hans" should map to "zh" (Simplified Chinese). Also mapping "zh-TW" to "zh" is not allowed even if you have only one Chinese translation available.

Soon, I will complete this article with a matching algorithm implemented in Python so anyone could port it to his own language.

## Resources

*   [Language tags in HTML and XML (W3C)](https://www.w3.org/International/articles/language-tags/)
*   [IANA listings of codes for languages, scripts, regions, variants and redundant codes in text, xml and SQL format (langtag.net)](http://www.langtag.net/registries/)
*   [Ethnologue.com](https://www.ethnologue.com/)- encyclopedic reference of languages.
