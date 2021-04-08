---
layout: page
title: About
permalink: /about/
---

Writing about yourself seems to always be challenge but somehow I need to put something on this page. Mainly I created this site as a blog, where I could share with others.

I live in [Norwich, UK](https://en.wikipedia.org/wiki/Norwich) and I am working for [Red Hat](https://www.redhat.com/en) \(IBM\) as part of the [OpenStack](https://www.openstack.org) team.

Nowadays, I do code mostly in [Python](https://www.python.org/), [Ansible](https://www.ansible.com/) and whatever else it takes to get the things done.

As I do like to give back to the community, I am a core contributor or maintainer in few Python-based open source projects like:

* Ansible related projects:
  * [ansible-lint](https://github.com/ansible/ansible-lint) - a project that helps you write better roles and playbooks by checking style and common usage mistakes.
  * [ansible molecule](https://github.com/ansible-community/molecule) and related [plugins](https://github.com/topics/molecule-driver) - playbooks and role testing framework for Ansible that orchestrates virtualized testing resources using local or cloud providers
  * [vscode-ansible](https://marketplace.visualstudio.com/items?itemName=zbr.vscode-ansible) A new vscode/codium extension that helps people edit Ansible content. It does integrate ansible-lint and a new set of schemas for validating the content and providing auto-complete.
  * [ansible-schemas](https://github.com/ansible-community/schemas/) - aims to build JSON Schemas for Ansible. Its primary consumer is the vscode-ansible extension.
  * [tox-ansible](https://github.com/ansible-community/tox-ansible) - Exposes molecule scenarios and ansible-test commands as tox commands, allowing you to use them without having to maintain complex `tox.ini` config files.
  * [pytest-molecule](https://pypi.org/project/pytest-molecule/) - a small plugin I made that enables pytest to detect and run molecule test scenarios. This precedes tox-ansible which I do recommend now instead of this one. Still, there is a good number of users using it as it has the ability to run multiple scenarios in a single run, something that the other one does not allow yet.
* [selinux](https://pypi.org/project/selinux/) - a small python shim library that unlocks access to system python selinux bindings when running inside virtual-environments. This library requires the presence of the original selinux binding library to be installed at the system level to work. This is fixing a very common issue people had with use of Ansible from inside such environments.

* Other Python projects:
  * [tox-bindep](https://github.com/tox-dev/tox-bindep) - runs bindep before running tox tests.
  * [tox-extra](https://github.com/tox-dev/tox-extra) - assure that tox returns an error if tests modify the source code or produce untracked files (git dirty check).
  * [cookiecutter](https://github.com/cookiecutter/cookiecutter) - create projects from templates
  * [pytest-plus](https://pypi.org/project/pytest-plus/) - adds extra functionality to pytest
  * [pytest-testinfra](https://github.com/philpep/testinfra) - write unit tests in Python which check the actual state of your servers configured by management tools
  * [jira](https://github.com/pycontribs/jira) - client library and CLI for communicating with JIRA Issue Tracker
  * [jenkins-job-builder](https://docs.openstack.org/infra/jenkins-job-builder/) and [python-jenkins](https://python-jenkins.readthedocs.io/en/latest/) - used to automate
  * [git-review](https://docs.openstack.org/infra/git-review/) - the client that eases interaction between git and Gerrit
  * [doc8](https://github.com/PyCQA/doc8) - style checker for RST
  * [hacking](https://pypi.org/project/hacking/) - OpenStack blend of flake8 and some plugins that can safely be used to lint projects. The projects is used to control the versions being installed, users still call flake8.

There are also few other projects which I am involved with:

* [bashate](https://github.com/openstack/bashate)
* [flake8](https://pypi.org/project/flake8)
* [pre-commit](https://pypi.org/project/pre-commit/)
* [pytest](https://pypi.org/project/pytest/)
* [pytest-cov](https://pypi.org/project/pytest-cov/)
* [pytest-html](https://pypi.org/project/pytest-html/)
* [pytest-xdist](https://pypi.org/project/pytest-xdist/)
* [tox](https://pypi.org/project/tox/)

I would also recommend few interesting python libraries, listed alphabetically:

* click
* jsonschema
* pydantic
* pyyaml
* rich
* tenacity
* typer
* typeshed

You may also want to check the list of [tools](/posts/tools) I use and occasionally fix a bug or two in those too.

# Website timeline

* 2019-12: I decided to migrate to [Hugo](https://gohugo.io/) from [GitBook](https://www.gitbook.com/) and, at least for the moment use the [hugo-theme-pure](https://github.com/xiaoheiAh/hugo-theme-pure/issues). The theme has lots of issues but most of them seem solvable.
* 2018: I move from Medium to GitBook.
* ????: I use Jekyll and Git Pages for a while.
* 2008: I opened this blog for posting articles related to software internationalization. It is likely that some of the articles are going to be specific to my native language, Romanian. During the years spend in software internationalization and localization managed to made me see software with many kinds of eyes, I still happily offer my support to those that in need of help in that area. At that time I used WordPress...
