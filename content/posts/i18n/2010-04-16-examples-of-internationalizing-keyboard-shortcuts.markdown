---
categories:
- i18n
date: "2010-04-16T00:00:00Z"
published: true
status: publish
tags:
- i18n
- keyboard
title: Examples of internationalizing keyboard shortcuts
---
This article tries to complete a previous article regarding internationalization of keyboard shortcuts. I decided to analyze  a few cases, in order to explain better how we should define keyboard shortcuts in a way that will keep them working on most international keyboards.<!--more-->

In order to keep the article simple I will ignore the modifiers state and I will explain only key related issues. Making modifiers work on different platforms is, usually, not a big deal.

## Example #1: Latin letters - CTRL+S (Save)

You may think that foreign language users are using other letters for defining the Save action. For example Save is ``Bruscar`` in Spanish so you may think that they are inclined to use ``Ctrl+B`` to save. No, this isn't happening. I wasn't able to identify any application that is localizing these shortcuts.

Many are forgetting that the most important function of the keyboard shortcuts is the accessibility or the ease of use. It's important to have common used functions easy to access: imagine you would have to press 4 keys spread all over the keyboard in order to access a common function like Save.

So we may consider that we could check the character code returned by the keyboard event in order to detect the shortcut. This will not work in cases like Greek keyboard where the same key will produce the sigma character(σ).

On Windows luckily Microsoft introduced the **virtual key codes** and any keyboard layout will generate ``VK_KEY_S`` (same code as ASCII character 'S'). They did a very good job in defining virtual key codes for all keys including special ones like ESC, Del, Ins, …

On Windows it's a good idea to **define keyboard shortcuts using virtual keys for most keys**. Yes, but only most, not all, because there is a small set of them that are dependent on the current keyboard layout being selected. I call these keys OEM keys because this is how they are named VK_OEM_.... and they are the key
<!-- ![Figure 1 OEM Keys](http://wp.sbarnea.com/wp-content/uploads/2010/04/041610_1500_Examplesofi1.jpg) -->

On the above layout there are 11 keys, called OEM keys that do have different virtual key-codes on localized keyboard layouts. The problem is that there may have values from a range of around ~16 values and that the characters produced by them are not consistent.

## Example #2: Zoom-inout using Ctrl+PlusMinus on small keyboard layout or from the keypad

First we have two sets of PlusMinus keys on a normal keyboard layout and it would be a mistake to consider them the same. For the keypad it is simple, by using the virtual key-codes they will work just fine (VK_ADD and VK_SUBTRACT).

Now the problem with the Plus and Minus from the US English keyboard layout is that they are OEM keys and if you use their codes (VK_OEM_MINUS and VK_OEM_PLUS) you will have problems with around 13 of the foreign keyboard layouts. For example on French layouts the zoom-in will work because the key is using the same code bug the zoom-out will not work because there is no such virtual key on the entire French layout.

<!-- ![Figure 2 Plus and Minus from US English layout](http://wp.sbarnea.com/wp-content/uploads/2010/04/041610_1500_Examplesofi2.png) -->

The easy workaround for this problem is to fallback to character code verification if the key event does not match any current keyboard shortcut.

# Visual representation of keyboard shortcuts

Especially if you want to use the OEM keys in shortcuts you will have to generate the shortcuts text description at runtime because this text depends on the current keyboard layout. If the user switches the keyboard layout the shortcut text (description) may change.

I managed to find an application, [MediaPlayer Classic](http://mpc-hc.sourceforge.net), that does let the user define the shortcuts using both virtual keys and character codes.

<!-- [![](http://wp.sbarnea.com/wp-content/uploads/2010/04/041610_1500_Examplesofi3.png)](http://mpc-hc.sourceforge.net) -->
