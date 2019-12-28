---
categories:
- i18n
date: "2008-12-09T00:00:00Z"
published: true
status: publish
tags:
- apple
- input
- keyboard
title: Virtual key codes on Apple OS X
---
On Windows, keyboard events are reporting scan codes,  virtual key codes and characters. If you want to deal with keyboard shortcuts and be able to use them in an international context you have to use the virtual key codes.
<!--more-->
Let's say that we want to implement ``Ctrl+A`` shortcut. In this case all we have to do is to look after ``VK_A`` virtual key.

* ``VK_A ``code is present on any keyboard layout even if the character produced is not A

* usually is on the same position, it does move only on some layouts like French [AZERTY](http://en.wikipedia.org/wiki/AZERTY), and it's  logical to be moved - if the keyboard has an "A" printed on it user is supposed to press this button - we can't request French users to switch ``Ctrl-Q`` and ``Ctrl-A` just because they have a different keyboard layout.
 * we can't rely on the characters because many layouts do not produce Latin characters or some keys are not even producing a character (dead keys).
 * it's not safe to use the scan codes because they will break on AZERTY, <a href="http://en.wikipedia.org/wiki/Dvorak_Simplified_Keyboard">DVORAK </a>and other layouts.
 
I think I do not have to explain more why virtual keys are the way we must store and process keyboard shortcuts.

And now let's try the same thing on Apple OS X platform. It does seem that apple has only 2 properties for keyboard events: key codes (`kEventParamKeyCode`) and characters. They consider key codes to be some sort of virtual keys, but in fact they are just physical key positions and this does mean that they are some sort of hardware independent scan codes.

So now I'm stuck with this big question:

<blockquote><p><strong><span style="color: #ff6600"><em>How do I detect that the user pressed <code>Command+A</code> under OS X in a way that will work with any keyboard layout?</em></span></strong></blockquote>

I should add that the user can have multiple keyboard layouts installed.

### External links
* Carbon keyboard events
* Virtual keys on Apple
*  [Virtual Key Codes on MacOS 10.12 Sierra](https://developer.apple.com/library/archive/technotes/tn2450/_index.html)
* [Losing the character code when using the control key](http://developer.apple.com/qa/qa2005/qa1446.html)
