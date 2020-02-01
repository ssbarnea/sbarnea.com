---
title: PyTest 101
date: 2019-09-23
categories:
  - python
description: >
  I decided to write a very short pytest introduction, so people would not hate me for sending them RTFD links.
url: /python/pytest
---

### List the tests

```bash
pytest --collect-only
```

### Run only specific tests

If you want to run only tests that have 'foo' in their name or path, it is as easy as:

```bash
pytest -k foo
```

Limit which tests run by using markers

Test markers are like ansible tags. Some labels can be assigned to tasks and you can decide which one you want to run or skip. They can be hardcoded in test definition or added dynamically.

```bash
# list markers available:
pytest --markers

# run only tests with a foo mark but without bar mark.
pytest -m foo -m "not bar"

```

### Control stdout and stderr capture

Sometimes you may want to see, in real-time, the output of various executed commands. This means that you may want to disable the default capturing of stdout/stderr.

```bash
pytest -s
```

> On my local machine I defined `PYTEST_OPTS=-s` so I don't need to remember adding it each time. Still, on CI we do not want to do this because disabling capture means that ``pytest`` would generate a report without stdout.

As a more advanced hint for tox users, you can also add `{tty:-s}` inside your `tox.ini` file. That means that capture will be disabled when you run on an interactive console \(your terminal\) but not on CI. Keep in mind that this [option](https://tox.readthedocs.io/en/latest/config.html#interactive-shell-substitution) is relatively new to tox. And yes, you could also use this feature to trigger the debugger via `--pdb`.

### Running tests in parallel

Keep in mind that the result of running tests in parallel depends a lot on how they were written. It is not uncommon to go into problems when running tests in parallel.

The default behavior is to avoid running in parallel.

```bash
# auto select number of processes based on your vCPU count
tox -n auto

```
