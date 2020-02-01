---
categories:
- i18n
date: "2009-04-21T00:00:00Z"
published: true
status: publish
tags:
- Unicode
- Visual Studio
- Windows
title: Using msdev resource editor to create Unicode dialogs that will not display
  well
---
I was surprised to discover that creating Unicode UI elements in the resource editor of Microsoft Visual Studio 2008 (SP1) does work, BUT when you compile your application they will fail to display well.
<!--more-->

I created two test Win32/Unicode native applications one using MFC and one without MFC - the issue appear on both. I didn't bother to test .NET because I'm not interested in it.

Take a look at my screenshots below. It's really simple to reproduce it yourself: just use the MSDEV Wizard to create a new application and paste some Unicode text into one of the dialogs.

Some interesting thing to consider:

*   I didn't change the font in the dialog - it's using the default value: "MS Shell Dlg"
*   If you modify the language of dialog from the default "English (United States)" to a language that does contains the testing characters they will display - but this is insane! It does mean that is still using codepages?! and worse that you cannot create a dialog containing characters from different scripts?
*   Isn't Windows supposed to do font face substitution?
*   I tested only on Windows XP SP3.

Sad but this does look like a <span style="color: #ff0000;">What You See is What you WON'T Get.

Later, same ... day[gallery]


Let's see the list of bugs I've just discovered on Microsoft Connect using it's "very sad" search feature

   *   By default the RC Files are not Unicode, even on Unicode projects, duh!
   *   Resource editor doesn't tell you to save the files as Unicode when you have Unicode characters on it. So you loose them without knowing it!
   *   Resource editor doesn't support UTF-8 - sad!
   *   Resource compiler doesn't support UTF-8 - sad!
         </ul>

Bugs found on Microsoft Connect: [176612](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=176612) [100833](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=100833) [162872](). Some of them being submitted 3 years ago for Visual Studio 2005: None of them solved even in newer versions like 2008.

## And the DIY formula

Open the RC file using text editor and save it using **File > Advanced Save Options** and select **Unicode - Codepage 1200**. It took me quite some time to figure it out just because several people considered that Unicode related bugs are not so important. Maybe we can suggest to rename the Unicode option from the Application Wizard to ["Partially Unicode".](https://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=162872)
