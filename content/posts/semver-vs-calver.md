---
categories:
- devops
date: "2020-12-15T00:10:00Z"
published: true
status: publish
tags:
- calver
- semver
- versioning
- release
title: SemVer vs CalVer Battle Royale
url: /posts/semver-vs-calver
---

# Picking a good versioning scheme

One would be surprised to see that even after decades of software development, there is no ultimate versioning scheme for software.

## SemVer

Yes, we all know about [SemVer](https://semver.org/) and its ``MAJOR.MINOR.PATCH`` benefits. That alone does solve the question regarding which numbers should be incremented based on what changes were made.

On the other hand SemVer does not take the passing of time into account and does not provide any information regarding how old is a release. Comparing age of various products becomes impossible by just looking at the numbers.


## CalVer

[CalVer](https://calver.org/), ``YYYY.MINOR.MICRO`` or similar, aims to address the aging issues and makes it much easier to compare versions across products. This can prove very useful when you look at dependencies as it may help you spot that 5 years old dependency that was never updated.

The only issue that I see with CalVer is that it also comes with various small variations. Please read its main page as it is very well written and gives several notable use cases and their reasoning.

## Making a decision

Based on what I seen so far, I am going to adopt ``YY.MINOR.MICRO`` for all my projects from now on, which happens to be what [pip](https://pypi.org/project/pip/#history) uses.

I do understand why pip is not using the full ```YYYY``` year because it does create a lot of boilerplate and reduces readability. If anyone ever reads the ``tox`` list of installed packages, you will understand what would be outcome if everyone end-up adopting a verbose year:

```!
$ tox -e lint
lint installed: appdirs==1.4.4,cfgv==3.2.0,click==7.1.2,distlib==0.3.1,filelock==3.0.12,identify==1.5.10,nodeenv==1.5.0,pip-tools==5.4.0,pre-commit==2.9.3,PyYAML==5.3.1,six==1.15.0,toml==0.10.2,virtualenv==20.2.2
```

As you can see use `YY` would only add one character per dependency, but ``YYYY`` would add 3 more, and reading long numbers is not really easy.

This means that:

* ``20.0`` is the first release from 2020 that breaks API compatibility
* ``20.2`` may also break API and clearly indicates it was not the first release of the year. What the numbers means is left to preferences of the maintainer: you can either increment or just use the **month** to indicate when it happened. If you make more than 12 breaking-change releases per year you have another kind of issue, which is not the a versioning one.
* ``19.0.1`` is a release that keeps API compatibility with 2019 versions but it may not necessarily be released in 2019, it could as well be a hot fix release January 2020 for the users of the old version.


You may also find [why-i-dont-like-semver](https://snarky.ca/why-i-dont-like-semver/) blog post, useful in your chaise for for ultimate versioning scheme.

Feel free to email me personally and tell me how wrong I am ;)
