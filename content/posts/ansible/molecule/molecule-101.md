---
title: Mastering Molecule
date: 2019-01-01
url: //molecule/molecule-101
categories:
  - molecule
tags:
  - ansible
---

## Controlling verbosity

Few things you may need to master quickly while working with molecule scenarios: how to control verbosity of different actions.

```bash
# disable nologs
export MOLECULE_NOLOG=0

# disable destroy
export MOLECULE_DESTROY=never

# debug mode (same as --debug) -- very verbose
export MOLECULE_DEBUG=1

# change ansible own verbosity
export ANSIBLE_VEBOSITY=2
```

## Passing Ansible arguments

In the end, molecule will call Ansible for testing your code but this does not mean that you cannot add your own options. You just need to use positional arguments for achieve that:

```bash
molecule test -- --tags foo
# this this call:
ansible-playbook ... --tags foo
```

Also you can use my favourite way of passing custom configuration by defining `ANSIBLE_` prefixed environment variables, which will be recognized by Ansible.


## Skipping tasks only during testing

Sometimes there are role tasks that you cannot or don't want to run during functional testing. There are two magic ansible tags that you can use to mark these: `notest` and `molecule-notest`. Keep in mind that you can also use them on blocks or even at playbook level.
