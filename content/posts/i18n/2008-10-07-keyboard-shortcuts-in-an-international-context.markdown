---
categories:
- i18n
date: "2008-10-07T00:00:00Z"
published: true
status: publish
tags:
- input
- key codes
- keyboard
title: Keyboard shortcuts in an international context
---

One common error in internationalization is to think that all shortcuts must be translated. People forgot that one of the major advantages of the shortcuts is that they are memorized their position on the keyboard and not by the sign on the key.
<!--more-->

From my point of view there are two types of keyboard shortcuts: the mnemonics (hot keys) and the normal keyboard shortcuts. Mnemonics are the underlined letters and they are fully translatable.

<img class="alignright size-full wp-image-48" src="http://wp.sbarnea.com/wp-content/uploads/2008/12/menus_edit.gif" alt="shortcut types" width="253" height="189" />

##Position is more important than the letter on the key.

One simple example is the Cut-Copy-Paste group they are all consecutive keys on the keyboard and are accessible only with one hand (Ctrl-X, Ctrl-C, Ctrl-V).

Another example would be the Undo function that is using Ctrl-Z on English. On a French keyboard it should map to Ctrl-Y because 'Y' and 'Z' are switched on these keyboards and we need to keep the position.

### Use the virtual key codes for remembering the shortcuts

In order to be able to make the shortcuts available on multiple keyboard layouts you need to store the virtual key codes reported by the keyboard not the letter reported. There are many people using multiple keyboard shortcuts on their computer and they are switching from one layout to another very often. So you can't rely on letters reported by OS but you can safely use the virtual key codes reported because these are not changing when the used is changing the layouts. In fact virtual key codes are.

You can find a full list of virtual key codes [here](http://www.kbdedit.com/manual/low_level_vk_list.html)
