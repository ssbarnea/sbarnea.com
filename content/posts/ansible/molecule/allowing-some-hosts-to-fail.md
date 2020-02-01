---
title: Allowing some molecule hosts to fail
description: >-
  How to convince ansible to fail execution only when some hosts are required,
  others being optional.
categories:
  - molecule
tags:
  - ansible
  - molecule
url: /molecule/allowing-some-hosts-to-fail
date: 2019-08-01
---

I got a special use case: where I has a group of hosts I wanted to test with molecule but I knew that at least one of them will fail with current code. I did not want to fail the execution due to the expected failure, so I ended up doing this complex logic below.

The first part detects only reacable hosts and avoid failing the playbook if they are reacable \(something that can happen if for example molecule fails to even create them\).

The second part is effectively running the tests and adds the hosts that pass to the `passed` group.

The last playbook decides the final outcome by comparing the list of required hosts with the list of passed ones.

I am not very please with the size of the current solution so if anyone has some better ways to do it, I would be more than happy to hear it.

```yaml
---

- name: identify reachable hosts
  hosts: all
  gather_facts: false
  ignore_errors: true
  ignore_unreachable: true
  tasks:
    - block:
        - name: this does nothing
          shell: exit 1
          register: result
      always:
        - add_host:
            name: "{{ inventory_hostname }}"
            group: reachable

- name: Converge
  hosts: reachable
  gather_facts: false
  tasks:
    - block:
        - shell: exit 0
    - debug: msg="{{ inventory_hostname }} is reachable"

    - add_host:
        name: "{{ inventory_hostname }}"
        group: passed

- name: Determine final outcome
  hosts: localhost
  tasks:
    - fail:
        msg: |
          Not enough hosts passed{{ ':'}} {{ missing | join(', ') }}
      vars:
        required:
          - localhost
        missing: "{{ required | difference(groups['passed']) }}"
      when: "{{ missing }}"
```
