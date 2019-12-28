---
categories:
- i18n
date: "2008-12-11T00:00:00Z"
published: true
status: publish
tags:
- keyboard
- shortcuts
title: Are we supposed to localize keyboard shortcuts?
---
When I'm talking about keyboard shortcuts to things like Ctrl-S or even one key shortcuts like 'A' (used to Archive an email on Gmail). On the other side the mnemonics, known as hotkeys or the underlined letters in menus or other GUI controls are clearly something that should be localized and I not going to argue about this.
<!--more-->

I've did some research to see how different companies are dealing with the shortcuts when people are using different languages and different keyboard layouts. Here are a short list of my results:

* If possible the shortcut is not changed
* If a key is not available on a specific layout we should try to use the same physical position
* There should be no link between application language and keyboard layouts. It's a mistake to consider that application language will match the keyboard layout. I'll give you just an example: in Romania over 95% of the computers are using US keyboard layout and the other 5% are using one of the 4-5 different Romanian keyboard layouts.
* some people are using multiple keyboard layouts - usually they are power users and we can't ignore them
* keyboard layouts can be switched anytime
* characters are safe to be used only if they are Latin

### Physical position rules
I think that the physical position of a key is more important than the letter printed on it. Here are my arguments:

* human brain is learning the shortcuts by hand movements just like the dog in [Pavlov's experiment](http://en.wikipedia.org/wiki/Classical_conditioning)
* it's compatible with the usage of multiple keyboard layouts

But it's not always so simple: we can't expect that the French users would swap the usage of Ctrl-Q with Ctrl-A ( Quit vs Select All) just because they are using different layouts. So a basic rule would be to stick to the layout for letters and numbers BUT try to use the physical position for other keys.

Anyway is high likely that people using multiple layouts would choose alike layouts (derived from the same root).

## One-to-one key matching

Because the number of keys is the same we have to find a way of remapping the keys so all shortcuts working on US to be usable on other layouts. When I'm referring to keys, I'm referring to the hardware keys.

## Case study

<table border="0">
<tbody>
<tr>
<th>key category</th></p>
<th>US</th></p>
<th>French</th></p>
<th>Turkish</th></p>
<th>Arabic</th></p>
<th>Details</th><br />
</tr></p>
<tr>
<td>letters</p>
<p>(26)</td></p>
<td>Q</td></p>
<td>swapped to A</td></p>
<td>moved where = was</td></p>
<td>same pos.<br />
diff char</td></p>
<td>We should follow layout movements for all letter keys.</td><br />
</tr></p>
<tr>
<td>signs (OEMs)</p>
<p>(11-12)</td></p>
<td>-_ (minus after 0)</td></p>
<td>now -_ is moved where =+ was</td></p>
<td>obtained with Shift-/</td></p>
<td>-</td></p>
<td rowspan="2">Some of the OEM keys are used in pairs and it's more important to keep key-pairs together than keeping the symbols on them.</td><br />
</tr></p>
<tr>
<td>signs (OEMs)</p>
<p>(11-12)</td></p>
<td>=+ (plus before backspace)</td></p>
<td>=+ is moved where / was.</p>
<p>note1: as you can observe these keys are no longer in pairs.</td></p>
<td>moved in the place of '"</p>
<p>note1: as you can observe these keys are no longer in pairs.<br />
</td></p>
<td>-</td><br />
</tr></p>
<tr>
<td>numeric</p>
<p>(10)</td></p>
<td>1</td></p>
<td>1 (produced with Shift)</td></p>
<td>1</td></p>
<td>1</td></p>
<td>We should not request French users to press Ctrl+Shift+1 instead of Ctrl+1 just because their keyboard are producing numbers only with shift pressed.</td><br />
</tr></p>
<tr>
<td>others</p>
<p>(...)</td></p>
<td colspan="4">F1, Backspace, Space, numpad ones, ....</td></p>
<td>We should have no problems with these if we are using virtual keys/scan codes.</td><br />
</tr><br />
</tbody></table></p>

<blockquote>
Question: <strong>How do I make OS X tell me that the key pressed by the user was 'q' when current layout is Arabic?</strong></p>

Rules:

 * we are not allowed to assume it's a 'q' just because the key code is the same, maybe it's a Arabic DVORAK keyboard!.
 * the shortcuts cannot be hardcoded (user can edit them)
</blockquote>

On Windows it does work 98% using virtual key codes and you can use them to extract this info, but on OS X the key codes (even Apple call them sometimes virtual key codes) they are some kind of scan codes. For the rest of 2% you have to do some small hacks with the OEMs.

## Current code

<code>
case kEventRawKeyDown:
  {
    unsigned char macChar;
    unsigned int keycode;
    unsigned int modifiers;
    unsigned int keyboardtype;
    OSStatus eventParamStatus = GetEventParameter( inEvent, kEventParamKeyMacCharCodes, typeChar, NULL, sizeof(macChar), NULL, &amp;macChar);
    GetEventParameter(inEvent, kEventParamKeyCode, typeUInt32, NULL, sizeof(keycode), NULL, &amp;keycode);
    GetEventParameter(inEvent, kEventParamKeyModifiers, typeUInt32, NULL, sizeof(modifiers), NULL, &amp;modifiers);
    GetEventParameter(inEvent, kEventParamKeyboardType, typeUInt32, NULL, sizeof(keyboardtype), NULL, &amp;keyboardtype);
  // kEventParamKeyMacCharCodes
   // for Latin characters it does behaves like Windows
   // for !Latin it does not return consistent data: on Arabic it does return the same as on US but on French it does return French specific characters for the OEM keys.
...
</keyboardtype), NULL, &amp;keyboardtype);
  // kEventParamKeyMacCharCodes
   // for Latin characters it does behaves like Windows
   // for !Latin it does not return consistent data: on Arabic it does return the same as on US but on French it does return French specific characters for the OEM keys.
   ...
</code>
