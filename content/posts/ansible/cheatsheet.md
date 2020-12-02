---
title: Ansible Cheatsheet
description: >-
  TBD
categories:
  - ansible
date: 2019-02-04
published: true
status: publish
tags:
  - ansible
url: /ansible/cheatsheet
---

## Variable precendence order

Order, order please!

1. command line values (eg "-u user")
1. role defaults
1. inventory file or script group vars
1. inventory group_vars/all
1. playbook group_vars/all
1. inventory group_vars/*
1. playbook group_vars/*
1. inventory file or script host vars
1. inventory host_vars/*
1. playbook host_vars/*
1. host facts / cached set_facts
1. play vars
1. play vars_prompt
1. play vars_files
1. role vars (defined in role/vars/main.yml)
1. block vars (only for tasks in block)
1. task vars (only for the task)
1. include_vars
1. set_facts / registered vars
1. role (and include_role) params
1. include params
1. extra vars (always win precedence)

## Load distro specific variables

```yaml
- name: Load operating system specific variables
  include_vars: "{{ item }}"
  failed_when: false
  loop:
      - "family-{{ ansible_os_family | lower }}.yml"
      - "family-{{ ansible_os_family | lower }}-{{ ansible_distribution_major_version | lower }}.yml"
      - "{{ ansible_distribution | lower | replace(' ', '-') }}.yml"
      - "{{ ansible_distribution | lower | replace(' ', '-') }}-{{ ansible_distribution_major_version | lower }}.yml"
      - "{{ ansible_distribution | lower | replace(' ', '-') }}-{{ ansible_distribution_version.split('.')[0:2] | join('-') | lower }}.yml"
      - "{{ ansible_distribution | lower | replace(' ', '-') }}-{{ ansible_distribution_version.split('.')[0:3] | join('-') | lower }}.yml"
```
