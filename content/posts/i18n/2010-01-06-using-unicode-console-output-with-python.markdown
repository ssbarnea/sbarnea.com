---
categories:
- i18n
date: "2010-01-06T00:00:00Z"
description: On Windows console and Unicode are not quite friends. Here is some code that
  I use in order to assure that my Python scripts output is consistent on all platforms
  and is supporting Unicode encoded as UTF-8.
published: true
status: publish
tags:
  - python
title: Using Unicode console output with Python
---

On Windows console and Unicode are not quite friends. Here is some code that I use in order to assure that my Python scripts output is consistent on all platforms and is supporting Unicode encoded as UTF-8.<a id="more"></a><a id="more-282"></a>

You'll be able to see the right characters if you are running on Windows 7 but on Windows XP you'll see the UTF-8 codes displayed as ANSI. Even with this problem you'll be able to redirect the output of stdout or stderr to files in order to store UTF-8 output.

On other platforms like Linux or OS X it will just use UTF-8 without any problems.

```python
#!/usr/bin/env python
# -*- coding: UTF-8 -*-
import codecs, sys
reload(sys)
sys.setdefaultencoding('utf-8')

print sys.getdefaultencoding()
if sys.platform == 'win32':
    try:
        import win32console
    except:
        print("Python Win32 Extensions module is required.")
        exit(-1)
    # win32console implementation  of SetConsoleCP does not return a value
    # CP_UTF8 = 65001
    win32console.SetConsoleCP(65001)
    if (win32console.GetConsoleCP() != 65001):
        throw ("Cannot set console codepage to 65001 (UTF-8)")
        win32console.SetConsoleOutputCP(65001)
    if (win32console.GetConsoleOutputCP() != 65001):
       throw ("Cannot set console output codepage to 65001 (UTF-8)")
    #import sys, codecs
    sys.stdout = codecs.getwriter('utf8')(sys.stdout)
    sys.stderr = codecs.getwriter('utf8')(sys.stderr)
print("This is an Е乂&alpha;mp١ȅ testing Unicode support using Arabic, Latin, Cyrillic, Greek, Hebrew and CJK code points.n")
```