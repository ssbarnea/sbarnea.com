---
categories:
- i18n
date: "2010-08-13T00:00:00Z"
published: true
status: publish
tags:
- Localization
- localization
- metrics
- statistics
- translating
title: Statistics regarding localized text
---
I've always thought it's hard to find statistical information regarding software localization, so I decided to gather some of them in one place. Here are some data that I collected over time regarding localized text. I hope you may find them useful.<!--more-->

These are for English and are referring to application strings, so it does not apply for documentation or marketing materials:

*   Average words/string: 3.6 words
*   Average characters/string: 22 characters
*   Most characters/strings: <1000

## Text size expansion when translated

These data were published by IBM, in their National Language Design Guide Volume 1:


| Characters in English | Average expansion |
| --- | --- |
| <10 | 200-300% |
| 11-20 | 180-200% |
| 21-30 | 160-280% |
| 31-50 | 140-160% |
| 51-70 | 130-140% |
| Over 70 | 150% |


You may find this very useful for UI strings because it allows you to do pseudo-localization with strings length expanding, in order to evaluate how your interface will behave.

I encountered the biggest expansions on Russian language, followed by French. If you rely on word-wrap, remember, that there are languages with very long strings, German being one of them.

## Translation metrics

*   IT/documentation - ~2000-2500 words/day (considering 8h workday)
*   Law/licensing – 50% speed decrease
*   On easy text you can boost the productivity a lot, reaching even 5000 words/day.

###### Resources

*   [http://www.w3.org/International/articles/article-text-size](http://www.w3.org/International/articles/article-text-size)

*   [http://www.w3.org/International/articles/article-text-size](http://www.w3.org/International/articles/article-text-size)
