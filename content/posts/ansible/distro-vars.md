---
title: Distro specific variables
description: >-
  This article documents a pattern for loading Ansible variables specific to
  various operating systems in a maintainable way.
categories:
  - ansible
date: 2019-09-16
published: true
status: publish
tags:
  - ansible
url: /ansible/distro-vars
---

Using `when` conditions in Ansible for adding support for multiple platforms and their versions does not scale well. As soon you need to support more than two versions it will hit you hard and make your code hard to maintain.

The trick is to load tailored presets for each platform and version when your role starts and use these values of these variables when performing tasks. Most of the time this saves you from adding conditions to tasks.

This can nicely be achieved by using an overlayed configuration file loading pattern, one that loads the more specific configs after more generic ones, overriding previously loaded values.

Doing this allows you to define overrides in a minimal number of places, more exactly at the location where the new config diverge from what the default one.

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
  tags:
    - always
  # pattern: v3

 # define variables in files like:
 # vars/family-redhat.yml # common to Fedora/RHEL/CentOS
 # vars/family-redhat-8.yml # applies to rhel 8 and centos 8
 # vars/centos-7.yml
 # vars/family-debian.yml # common to Debian, Ubuntu,...
 # vars/ubuntu.yml # all Ubuntu versions
```

The example above is the current version which I am currently using whenever I need to load OS specific variables in Ansible.

As you can see, I included a version on it in order to better track changes. The v2 was introduced recently by adding the family suffix. This was needed in order to avoid an unexpected bug caused by the fact that, for Red Hat Enterprise Linux, Ansible populates both `ansible_os_family` and `ansible_distribution` with `RedHat`, meaning that 1st file and 3rd line would be the same and we would not be able to load configuration correctly.

This type of configuration loading is very easy to understand and is less-error prone than editing conditions spread across the role. It major advantage is that it isolates config from code.

My hope for the future is that Ansible will be able to do this automatically if you create the special files in vars/, so you would not even need to manually load the at the start of the playbook.

```python
# You may find this mapping useful:
OS_FAMILY = dict(
            RedHat = 'RedHat',
            Fedora = 'RedHat',
            CentOS = 'RedHat',
            Scientific = 'RedHat',
            SLC = 'RedHat',
            Ascendos = 'RedHat',
            CloudLinux = 'RedHat',
            PSBM = 'RedHat',
            OracleLinux = 'RedHat',
            OVS = 'RedHat',
            OEL = 'RedHat',
            Amazon = 'RedHat',
            XenServer = 'RedHat',
            Ubuntu = 'Debian',
            Debian = 'Debian',
            SLES = 'Suse',
            SLED = 'Suse',
            OpenSuSE = 'Suse',
            SuSE = 'Suse',
            Gentoo = 'Gentoo',
            Archlinux = 'Archlinux',
            Mandriva = 'Mandrake',
            Mandrake = 'Mandrake',
            Solaris = 'Solaris',
            Nexenta = 'Solaris',
            OmniOS = 'Solaris',
            OpenIndiana = 'Solaris',
            SmartOS = 'Solaris',
            AIX = 'AIX',
            Alpine = 'Alpine',
            MacOSX = 'Darwin',
            FreeBSD = 'FreeBSD',
            HPUX = 'HP-UX'
        )
```
