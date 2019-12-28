---
title: Mastering Ansible lint
slug: ansible-lint
description: Some hints about using ansible-lint
date: 2019-10-21
categories:
  - ansible
tags:
  - ansible-lint
  - lint
url: /lint/ansible-lint
---
Writing easy to maintain Ansible roles and playbooks is more of secret art that
will take years to master. Product documentation is useful but is far from
complete and lacks lots of hints.

<!--more-->
### Avoiding false positives

You can use `noqa` comments to disable specific rules. Be careful not to put
them on multi-line YAML blocks as they will not be loaded as comments.
```yaml
    - name: some ansible task
      # noqa 305 <-- correct
      shell: |
        env  # 305 <-- not correct
```

If the false positives are too many or if you are just in the process of
adopting the linter, narrow down its scope:

```yaml
# .ansible-lint
exclude_paths:
    - .travis.yml  # be careful not to exclude too much
skip_list:
    - 305  # Disable rule, include link to bug that forced you to disable it
```

### Accessing Ansible modules from other repos

In the unlikely case where you would end up with `ansible-lint` errors caused by the fact that it fails to find some Ansible modules which may not even be located inside your own repository, I provide this hack for you which assures is able to find `zuul_return` module which is part of `zuul` Python package.<!--more-->

```yaml  title=".pre-commit-config.yaml"
  - repo: https://github.com/ansible/ansible-lint.git
    rev: v4.1.1a0
    hooks:
      - id: ansible-lint
        files: \.(yaml|yml)$
        # Helps it find zuul_return module on both zuul and on dev environments,
        # Based on https://github.com/pre-commit/pre-commit/issues/758
        entry: >
          bash -c 'env ANSIBLE_LIBRARY=`python -c "import os, zuul;
          print(os.path.dirname(zuul.__file__))"`/ansible/base/actiongeneral/
          ansible-lint --force-color -v "$@"'
        exclude: playbooks/legacy
        additional_dependencies:
          - zuul
```





