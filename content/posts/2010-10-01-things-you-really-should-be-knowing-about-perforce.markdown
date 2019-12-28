---
categories:
- tools
date: "2010-10-01T00:00:00Z"
published: true
status: publish
tags:
- perforce
- scm
title: Things you really should be knowing about Perforce
---
My 3 years experience with Perforce was not one of the best ones and I decided to share some things that you may not know about Perforce, ones that you are not going to find in any marketing document.
<!--more-->
## Limited support for ignoring files or directories
 If you used Subversion, Git or others probably you are already used to mark some files or directories to be ignored. On these systems ignore patterns are stored on the server and they do apply for all the users. This does make perfectly sense for me, if you want to stop your SCM from looking for ``.pyc`` files or temp directories you add the rule and everybody will benefit from it.

Now if you try to obtain the same behavior in Perforce you will be surprised that what their support for ignoring files is not what you would expect.

First, you can define the ignoring patterns in your clientspec, so they will be available only to this clientspec, meaning that you will have to multiply them in all your clientspecs. Sharing them with others? ... yep copy/paste.

Now lets try to have a deeper look on how they really work:

*   partially supported only in GUI (p4v) - for example they will continue to show in file tree and even when you use the Reconcile Offline Files. In fact the only place where they are working is on Advanced Reconcile - a place that you probably do not need/want to use.</li>
*   forking? .... you just have to recreate the ignore pattern in the view.

Now imagine that I do work a lot with Python and that entire source tree is full with temporary ``.pyc`` files.

### Mapping the same repository file/directory to multiple locations on disk

Nope, this is not something you can do - you can try but it will fail to work properly. Trust me, it will save you precious time.

### Having workspaces mapped to the same directory

If you do not want troubles, do not forget to keep each workspace (clientspec) in its own directory and be sure that these directories do not overlap, even partially.

### Running as root under OS X, not quite
The login is not working well on OS X if you run perforce as root, this is happening because the system does not have HOME environment variable for this user. Do you what what was the response from support: why do you run Perforce as root? WTF!

I don't want to imply that perforce support in not good, in fact I have to confess that they are very well prepared and give well documented answers and really fast. In fact the above case was the only mistake they made.

Workspaces (clientspecs) that are too hard to maintain

Do you have a big projects with tens of developers if not hundreds, and you change the project structure - now each developer will have to update all his workspaces to match the new one.

It was so hard for Perforce to add something like an @import to the clientspec, so it could just base a workspace on another one?

Now another "cool", feature is that it is not possible just to copy and paste the view definition from one workspace to another because you will have to do some find-n-replace on it to replace the original clientspec name from each line with your name.

It's true that there is an option to clone a clientspec, but this will create a new clientspec and you will still be required to move your customizations to it.

### Personal conclusions
First, I want to say that even with the problems presented above, Perforce is a very reliable tool and I am not aware about any open-source solution that would be able to deal with repositories of hundreds of gigabytes and a changelist history of 6 digits.

If you know other workarounds for Perforce let me know.