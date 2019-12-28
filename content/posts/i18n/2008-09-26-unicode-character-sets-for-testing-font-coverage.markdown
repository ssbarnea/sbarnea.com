---
categories:
- i18n
date: "2008-09-26T00:00:00Z"
published: true
status: publish
tags:
- fonts
- Unicode
title: Unicode character sets for testing font coverage
---
<!-- .unicode-sample{ color: green; letter-spacing: 1em; text-wrap: unrestricted; word-wrap: break-word; wrap-option:emergency; } -->

Testing Unicode coverage for fonts is always a problem and I decided to create a simple set of character sets for testing the coverage. I've splat them by language groups based on regions. Using these strings should be quite easy.
<!--more-->
You should remember some things:

* It's not safe to test font strings inside the browsers because they do have font-fallback
* soon I will add font-coverage for the most used fonts

Simple scripts - Latin, Cyrillic and Greek

Groups from 1-4 are additive, so characters already included in previous groups are removed

#### Group 1 - Basic - 5 languages - en, fr, es, de, it
<p class="unicode-sample">&ordm;&szlig;&agrave;&aacute;&acirc;&atilde;&auml;&aring;&aelig;&ccedil;&egrave;&eacute;&ecirc;&euml;&igrave;&iacute;&icirc;&iuml;&ntilde;&ograve;&oacute;&ocirc;&ouml;&oslash;<br />
&ugrave;&uacute;&ucirc;&uuml;&yuml;āăčēĕīĭōŏ&oelig;&scaron;ūŭžǔ</p>

### Group 2 - Western - 6 languages - da, fi, nb, nl, pt, sv

<p class="unicode-sample">&otilde;đńŋřŧǎǥǧǩǯȟʒ</p></p>
<h4>Group 3 - Eastern - 10 languages - ro, tr, pl, cs, hu, sk ,hr, et, lv, sl</h4></p>
<p class="unicode-sample">&yacute;ąćďđėęěğģįİıķĺļľłņňőŕ<br />
śşţťůűųźżșțіїј</p>
<h4><strong>Group 4 - Cyrillic - 5 languages - </strong>ru, uk bg lt sr</h4></p>
<p class="unicode-sample">абвгдежзийклмнопрстуф<br />
хцчшщъыьэюяѐёђєіїјљњ<br />
ћѝџѣѫґ</p>

### Group 5- Greek
... TBD</p>

## Complex Scripts (to be done)
<li>Japanese</li>
<li>Korean</li>
<li>Chinese</li>
<li>Arabic</li>
<li>Hebrew</li>
<li>Greek</li><br />


## How to test fonts under Windows ?
If you want to see character coverage you should use <a href="http://www.babelstone.co.uk/Software/BabelMap.html">BabelMap</a>, and if you want to write different texts you can use <a href="http://www.babelstone.co.uk/Software/BabelPad.html">BabelPad</a>. These two tools the best I've found so far and are free.
