---
categories:
- i18n
date: "2010-10-26T00:00:00Z"
published: true
status: publish
tags:
- cms
title: How to measure muti-language support of a CMS solution
---
Most CMS solutions are marketing their multi-language support but in reality few of them do have good support for creating and maintaining multi-language websites.
<!--more-->
In order to give a real measurement regarding the support for multi-language I created a multi-language support-scorecard.

To properly evaluate a solution you need to find the answer to the following questions. Most likely you will have to install it and play with in in order to find the answers.

### Can you declare the language of a specific page

Any CMS should allow you to declare the language of a page.

### Can you define different menus for each language?

The navigation menu is not just another thing that needs to be translated, in many cases it will need to be customized for the target audience, meaning that it may be very different from the original one

### Can you link a page from another language?

In the real word you will never achieve a 100% translation and you will have to link to pages that are available only in other languages.

### When a page is translated are the links to it updated?

This should be explained, a website is never fully translated and is normal to insert links to pages in another language if these are not translated. A smart CMS will update the links if you add a translation later.

Later, some translated pages may become obsolete and you may want or need to remove them. A smart CMS will redirect the links to the same page in other language if the original translation was removed.

### Are the links updated inside the articles?
For SEO purposes you want to update links inside the pages instead of doing redirects. Anyway even the redirects are much better than 404s.

### Can you easily insert links?

It is something very common to insert links inside pages. The CMS must allow you to do this without requiring you to know the URL of the target page. Still listing all the pages in all available languages can easily became an issue even for small sites. In order to simplify your work the system should present you a list that will contain all pages translated to current language *and* all pages not available in current language. This means that if you have a page that is already translated in your language you will not see its translations listed again.

### Can you customize the URL, html tile or attributes?

Probably these features do not require any explanation.

### Does it generate properly ASCII text for the URLs?

Unicode URLs are supported now by most browsers but simple ASCII ones are preferred for most languages, especially for those that are using the Latin alphabet and where it is easier to type them without diacritics. The CMS should be able to convert the Unicode page title into a simplified version that does include Unicode characters.</p>
