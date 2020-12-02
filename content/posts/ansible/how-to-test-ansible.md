---
title: How to test my Ansible content?
slug: how-to-test-ansible
description: A description of the tools and methods needed for testing Ansible.
date: 2020-12-02
categories:
  - ansible
tags:
  - ansible-lint
  - lint
  - molecule
  - ansible-test
url: /ansible/testing-your-code
---

As community documentation guidelines for testing Ansible collections are
still pending update, I will try to clarify few of the most important aspects
today.

You will see **collections** and **content** used almost as synonims, and that
is not wrong. Colections can contain any combination of playbooks, roles,
plugins or modules.

Collections do replace the galaxy roles which are now in deprecation mode, and
the only expectation is that authors will convert them to collections. If they
decide to group multiple roles into a single collection or keep them separated
is fully up to them.

Keep in mind that all the tools mentioned below are under active development
as their maintainers are doing their best to improve them.

All projects but one, ansible-test, are community supported which means that
they do relay on community for making improvements and bugfixes.  If you find
a bug on any of these, you can go directly and make a PR to fix it.

### Tools and project to use

* [ansible-lint](https://ansible-lint.readthedocs.io/en/latest/) can help you with a huge range of aspects, including steps you
  need to take in the future. It is by far the easier tool to introduce to
  your workflow.
* [molecule](https://molecule.readthedocs.io/en/latest/) covers **functional and integration** testing of ansible playbooks
  and roles, basically using ansible to test ansible. It does not depend
* [ansible-test](https://docs.ansible.com/ansible/latest/dev_guide/developing_collections.html#testing-collections) is included with Ansible and is focused on testing ansible
  modules, with different versions of python or ansible. If you have ansible
  modules inside your repository. If you are acustomized with testing pyramid,
  you could put ansible-test somewere between **unit and functional**
  testing.
* [toolset](https://github.com/ansible-community/toolset) is a container that combines all the development tools above
  alongside latest version of Ansible. The project is very new, and it aims
  to help those that may not fully master the art of installing python packages
  using pip inside virtual environments.
* [protogen](https://github.com/ansible-community/protogen) is another fresh project that aims to become a reference
  implementation on how to write and test a collection. Basically it
  is an attempt to document by example how to do it right.

### Q&A

#### Should I use molecule or ansible-test?

Both projects are supported, if the most important part of your code are
roles and playbooks, use molecule first.

If the most important part are ansible modules, pick ansible-test.

If you have boths, sooner or later you will need both.

At least for the forseable future none of them is going to replace the other.

#### What can I do if I need to support ancient ansible versions?

While collections were only introduced in Ansible 2.9, there is nothing
stopping you from converting your repository to a collection layout while
still keeping your code compatible with old versions of Ansible.

Basically collections resolve the packaging and installation issue, so for
older versions of Ansible, you will have to install them manually in
locations where ansible can find them.

If you already have a `roles` folder at the root of your repository you are
likely already half-way towards a collection. Look at [collection structure](https://docs.ansible.com/ansible/latest/dev_guide/developing_collections.html#collection-structure) and see
what changes you should do.

If you do not need to support Windows platform, you can make use
of relative symlinks in order to ease migration without breaking software
that may expect your roles to be in a different location.

#### Where can I get help?

If you want to chat, the best place to engage with others is `#ansible-community`
irc channel on freenode.
