---
categories:
- i18n
date: "2009-05-22T00:00:00Z"
published: true
status: publish
tags:
  - translating
  - romanian
title: Google Groups translations not passing even the simplest spell check test
---
I'm a strong admirer of Google business model but I keep wondering how did they managed to obtain such&nbsp;a huge number of typos inside their translation to Romanian language. I don't have inside information about the approaches they made in order to localize Google Groups but I have serious doubts about having any kind of quality check.

<!--more-->
Below you'll find a screenshot of the "post new message window" from Google Groups, inside this page there are two serious typos on the most important parts. Any Romanian speaker will observe these in less than 10 seconds.<a href="http://wp.sbarnea.com/wp-content/uploads/2009/05/google_groups_translation_bug.png"></a>

By looking at this we can draw some conclusions:

* Google didn't use machine translation when localizing Google Groups
 * The translators made a poor job - they used an non-existent verb for "post" (send a message)
 * If they had any QE they did a really poor job
 * They do not have a spell check test included in the localization process.
 *There is no way of submitting errors inside the translations

I suppose that now nobody will disclose the name of the vendor working on this :)

Few days ago Google silently launched Google Profiles and here I've encountered a classical "out of context" translation bug. They translated the phone type "home" as "home page" in Romanian instead of using "at home". This kind of error is classical on machine translation but I'm afraid that their machine translator could do a better job. Sad, but I wasn't able to translate the same page using their online translation engine.

<p><a href="http://wp.sbarnea.com/wp-content/uploads/2009/05/google_profiles_translation_bug.png"></a></p>
