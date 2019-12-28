---
categories:
- i18n
date: "2009-01-17T00:00:00Z"
published: true
status: publish
tags:
- charset
- HTTP
- language
title: Selecting the right language on web applications
---

Choosing the right language for web applications is not quite an easy task. There are many source of information and you have to figure a good algorithm for making the best decision. As I didn't found yet the "right" implementation I decided to describe the algorithm.
<!--more-->
First we should identify the source of language related data we could use for making a decision:

* HTTP_ACCEPT_LANGUAGE - included in any HTTP request. Something like:  ``en-ca,en-gb;q=0.7,en;q=0.3`` - "q" parameter indicates the quality (higher is better).

* user preference: a cookie or user preference if the user is already logged in
* your list of supported languages
* (optional) Your list of language fallback preferences, in case you do not have one we can consider that it is "en"
* (optional) `HTTP_ACCEPT_CHARSET`
* (optional) IP address - this can be converted to a country or language.

### Basic rules

* If user had a preference (cookie/profile) and it's a valid we use it - return
* We try to match all language variants existing in ``HTTP_ACCEPT_LANGUAGE`` with our list of supported languages and select first match - return
* If we have language fallback list we choose the first language from it - return
* We'll choose 'en' if it is present in the supported language list - return.
* We'll choose first available language from the supported language list - return.

### Remarks

* I ignore the requested charset because I prefer to use UTF-8 everywhere. I don't want to convince you it's the necessary best choice but from my point of view it is pretty good. I'm aware that there are still mobile devices on the market without UTF-8 support.
* I ignore the IP information because I consider it not so relevant - there are many people traveling and you'll get his current location, also it's harder to implement.
* Possible future improvements: create a small list of languages user may know (probability). Let's say I have an website in 50 languages and I want to show to the users only the first 2-3 languages and a selection control (combobox) for the entire list. Here it could be very useful to use the information provided by the IP address.

### Questions still to be answered
Could we figure a way of displaying combined content based on user preference? It's high likely that your website may not contain all articles in all languages and that some users will want to real articles in several languages.

How can we display this option to the user? Remember that you can't display a huge list of checkboxes to the user - it should be something small and intuitive.
