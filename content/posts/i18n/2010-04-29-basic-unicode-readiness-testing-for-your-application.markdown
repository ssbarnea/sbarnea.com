---
author:
  display_name: sorin
  email: sorin.sbarnea@gmail.com
  login: sorin
  url: https://sbarnea.com
author_email: sorin.sbarnea@gmail.com
author_login: sorin
author_url: https://sbarnea.com
categories:
- i18n
date: "2010-04-29T00:00:00Z"
date_gmt: MjAxMC0wNC0yOSAxNToxMToyMiArMDAwMA==
excerpt: Unicode is a very complex standard, always evolving, but this doesn't mean
  you shouldn't do some basic testing, in order to uncover hidden bugs.
published: true
status: publish
tags: []
title: Basic Unicode readiness testing for your application
wordpress_id: 343
wordpress_url: http://blog.i18n.ro/basic-unicode-readiness-testing-for-your-application/
---
<p>Unicode is a very complex standard, always evolving, but this doesn't mean you shouldn't do some basic testing, in order to uncover hidden bugs.<a id="more"></a><a id="more-343"></a></p>
<p>Here is a small Unicode string that could be used to test the readiness of your application to deal with Unicode strings. You can use this string to:</p>
<ul>
<li><strong>filename<&#47;strong> - save and load files using this string as port of the filename. Also you should try a long path of more than 260 characters in order to find problems regarding usage of older API under Windows.<&#47;li>
<li>
<div><strong>text input<&#47;strong> (paste it) and see if the application will display it wrongly.<&#47;div></p>
<ul>
<li><strong>input cursor<&#47;strong> &ndash; first check how cursor moves under Notepad on Windows 7 and see if your application behaves the same. If you'll see strange character movements or decompositions, you are doing something wrong.<&#47;li>
<li><strong>selection <&#47;strong>&ndash; as above, check the notepad fist and after this check if your application does select text the same way<&#47;li><br />
<&#47;ul><br />
<&#47;li></p>
<li>
<div><strong>rendering<&#47;strong>, if your application is rendering text somewhere, it's a good idea to use it to see if it does render well<&#47;div></p>
<ul>
<li><strong>text size<&#47;strong>, are the CJK characters too small to be recognized?<&#47;li>
<li><strong>bad rendering<&#47;strong>, an empty rectangle may indicate a missing glyph (required font missing), this is not very dangerous &ndash; nobody has all the fonts but if you see question marks or other strange things you may have a real problem. It's best if your application does support font-fallback, when it does display text in order to prevent the missing glyph sign.<&#47;li><br />
<&#47;ul><br />
<&#47;li><br />
<&#47;ul><br />
I will post a <a href="http:&#47;&#47;blog.i18n.ro&#47;custom&#47;unicode_readiness_basic_test.txt">text file encoded as UTF-8<&#47;a> (with BOM) that contains the test string because Wordpress will cut the article where it does find the character outside Unicode BMP.</p>
<p><img src="http:&#47;&#47;wp.sbarnea.com&#47;wp-content&#47;uploads&#47;2010&#47;04&#47;042910_1508_BasicUnicod1.png" alt="" &#47;></p>
<p>Let me know if this helped you and if you know additional tests that I could include in this basic test.</p>
