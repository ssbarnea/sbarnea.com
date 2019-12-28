---
categories:
- i18n
date: "2009-04-22T00:00:00Z"
excerpt: |-
  I decided to start a series of Tips&amp;Tricks posts that anyone can use for fast 18n bug finding in their application. As you can know the speed is really important when it comes on solving bugs.

  What is an altered English dictionary? it's a virtual translation of your English translatable strings to English but using characters from other languages that are similar to the ones from English.... shortly it's a find-and-replace by character.
tags:
- mocked
- qa
- testing
- localization
- translating
title: Altered English dictionary
slug: altered-english-dictionary
---
I decided to start a series of Tips & Tricks posts that anyone can use for fast 18n bug finding in their application. As you can know the speed is really important when it comes on solving bugs.

What is an altered English dictionary? it's a virtual translation of your English translatable strings to English but using characters from other languages that are similar to the ones from English.... shortly it's a find-and-replace by character.

### Stage #1
Take a look at my <a href="https://en.wikipedia.org/wiki/Pangram">pangram</a> example:

```
Original text: The quick brown fox jumps over the lazy dog
Altered text: Tђę qنicķ bř&oslash;̊ώn f&oslash;̊ㄨ jنmpș &oslash;̊vęř țђę ľдźע đ&oslash;̊ǥ.
```

You can still use the application even if you do know only English but you'll be able to see if you have i18n bugs inside.

You'll discover the part of your application that are not using Unicode very fast this way because there is no way of displaying these characters using a single code page.

This is going to help you find hard corded strings that where not translated.

### Stage #2
You can extend the text modification a little bit in order to test for some other issues like:

* UI doesn't trim longer texts. As you can see below adding special markers at the start and the end of the string will undercover these much faster.
* Font size is appropriate for Arabic and complex East-Asian languages. Just before the end of the string are the most complex Asian symbol. Can you differentiate the strokes? if not you should really consider increasing the default font size.

```
Altered text stage 2: Tђę qنicķ bř&oslash;̊ώn f&oslash;̊ㄨ jنmpș &oslash;̊vęř țђę ľдźע đ&oslash;̊ǥ. 齉龘
```

You really should pass the above tests before starting the translations. If you do so this will pay-off several times later in the localization process.