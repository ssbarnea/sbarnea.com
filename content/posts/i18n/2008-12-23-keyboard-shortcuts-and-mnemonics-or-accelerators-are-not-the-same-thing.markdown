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
- usability
date: "2008-12-23T00:00:00Z"
date_gmt: MjAwOC0xMi0yMyAxNTozMDoyNyArMDAwMA==
excerpt: Over the time I've found that there are misunderstandings between the concept
  of the <strong>keyboard shortcuts<&#47;strong> and <strong>mnemonics<&#47;strong>.
  I will try to clarify this problem because the differences are important specially
  from the point of view of software localization.
published: true
status: publish
tags:
- accelerator
- keyboard
- mnemonics
- shortcuts
title: Keyboard shortcuts and mnemonics or accelerators are not the same thing!
wordpress_id: 121
wordpress_url: http://blog.i18n.ro/?p=121
---
<p>Over the time I've found that there are misunderstandings between the concept of the <strong>keyboard shortcuts<&#47;strong> and <strong>mnemonics<&#47;strong>. I will try to clarify this problem because the differences are important specially from the point of view of software localization.<a id="more"></a><a id="more-121"></a></p>
<p>[caption id="attachment_125" align="alignright" width="260" caption="Keyboard shortcuts in green and mnemonics in yellow."]<img class="size-full wp-image-125" src="http:&#47;&#47;wp.sbarnea.com&#47;wp-content&#47;uploads&#47;2008&#47;12&#47;keyboard_shortcuts_mnemonics.png" alt="Keyboard shortcuts in green and mnemonics in yellow." width="260" height="288" &#47;>[&#47;caption]</p>
<p>The best keyboard related definition I've found for mnemonic it was on <a href="http:&#47;&#47;java.sun.com&#47;products&#47;jlf&#47;ed2&#47;book&#47;HIG.Glossary.html#51661">Sun Java glossary<&#47;a>:</p>
<blockquote><p><strong>mnemonic<&#47;strong> - An underlined alphanumeric character, typically in a menu title, menu item, or the text of a button or component. A mnemonic shows the user which key to press (in conjunction with the Alt key) to activate a command or navigate to a component.<&#47;blockquote><br />
If you had Win32 experience you may call them "menu accelerators". They define the letter used for triggering them by using Ampersand (&amp;) inside the menu text. I would not recommend the usage of "accelerator" term because looking over the net I've found that in many cases it does refer to keyboard shortcuts.</p>
<p>If you are wondering why it's important to clearly distinguish between them: it's because the mnemonics are changing when the UI language is localized but the keyboard 	<a href="&#47;?p=85">shortcuts are not supposed to be localized<&#47;a>.<br />
.</p>
