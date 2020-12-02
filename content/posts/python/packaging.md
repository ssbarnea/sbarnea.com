---
title: Penultimate Guide to Python Packaging
date: 2020-02-02
categories:
  - python
description: >
  I decided to write a very short pytest introduction, so people would not hate me for sending them RTFD links.
url: /python/pytest
---
# Penultimate Guide to Python Packaging

If you came here hoping to finally find the answer about how to correctly create
python packages you will have a big dissapointment.

I will be very happy to replace this article with one that gives a decent
recipe any packager can follow for producing sdists and wheels.

## pyproject.toml hidden gems

If you dare to create a `pyproject.toml` file for your project you will use
the ability to make editable installs with pip.

Package installation speed seems to slow down considerably when you go the TOML
way. I noticed that for simple packages that used to take 2s to install, now
I have to wait like 5-6s for the same operation, and this runs every time you
run tox.

## Flit Project

[Flit](https://github.com/takluyver/flit) aims to simplify packaging but fail
to deliver on:

* requiring to put your packages(s) in 'src' folder, not configurable
* Refusal to allow [SCM based versioning](https://github.com/takluyver/flit/pull/199)
* it is yet another project relying on a single guy, which for packaging is
  clearly not something sane to do.
* Use of flit seems to exclusive with standard setuptools packaging, so you
  cannot use two build-backend options in parallel, which you may want.

Other than this, I do like that flit has a symlink option that matches the
pip editable installs, this being a big plus.

## Poetry Project

https://github.com/python-poetry/poetry


## Other resources

If you want to go to sleep with a big headache, here are few useful resources
you should read related to packaging. Keep in mind that what was true or good
practice at one moment in time, may prove the opposite few months later.

* <https://discuss.python.org/c/packaging/14>
