---
date: 2020-01-23
title: Using black and flake8 in tandem
url: /lint/black
categories:
  - python
tags:
  - lint
---

This article assumes you are already familiar with [flake8]. Probably you faced at
least one of the challenges below related to:

* adoption requires a lot of code reformatting
* some rules contradict each other, like `W503`/`W504`
* different rules on different projects
* newer versions requiring rework
* ... why I am wasting my time with linting

Years ago, [OpenStack] team release a package named [hacking] which
aimed to address some of the problems listed above. It was a brilliant idea
for reducing churn around flake8.

Still [hacking] did not help migrating codebases to pass various PEP rules and
neither preventing divergent preferences across projects.

Code formatting tools for Python existed for a very long time, with [autopep8] and
[yapf] being quite well known. Still, they came with other issues attached to them,
so they did not manage to get too much popularity.

But then [Black] came to the picture, with a very bold tagline *Black is the uncompromising Python code formatter* as a direct reference to the famous Ford quote.  To summarize, sometimes a lack of options is a feature by itself.  It did work for Ford, and also worked for Black.

The project was even moved under [Python Software Foundation][psf] back in 2019, which
is a confirmation of its importance to the Python community. The list of [famous packages][users]
adopting it grows every day, including Django, PyTest, tox, pandas, sqlalchemy, virtualenv.
I doubt you have a single project that does not list at least two of these as upstream dependencies.

## Where is the value of consistent code style

Many argue that coding style is a personal decision. This may be true if you
work like a hermit and you are the only contributor of your project.

I see personal styles as being hindering collaboration and contributions
to open source projects. Why wasting time debating code style during a code
review when we can spend time reviewing code functionality instead?

That is one of the reasons why I was a big supporter of using linters. They
offload this boring task and avoid getting personal. When the linting job fails
in CI (if they missed checking locally), the developer will know what to do to
fix it, without having to bother another human.

## Would black introduce bugs in my source

Black will not ever change the behavior of your code after reformating because it
assures that the Python bytecode remains the same. So, it does reformat only
stuff that do not affect how code runs.

## Does back replace flake8

Not at all. Black only reformats, you still run [flake8] to check for various
issues not covered by black. Flake8 very close to be perfectly compatible with
black.

## Configuring flake8 to meet black style

As you can see below, there are very few changes needed.  Keep in mind that
your flake8 config may be located in another location.  I mention here only
the recommended one. For example, using `tox.ini` for this is not recommended
because it is specific to [tox] and you may want to assure flake8 config is loaded
regardless if it is called form tox our from outside, like an IDE.

```ini
# setup.cfg

[flake8]
# Recommend matching the black line length (default 88),
# rather than using the flake8 default of 79:
max-line-length = 88
extend-ignore =
    # See https://github.com/PyCQA/pycodestyle/issues/373
    E203,
```

## What about double quote replacements

Indeed, the requoting is the most controversial decision ever made by black
but the good news is that this sole option **can be disabled**.

I hated it initially, but after reading more I kinda understand why
it was done like this. These days I support it, in a black purrist kind of way.

For projects with more than two contributors I suggest disabling requoting as
it would make adoption even more controversial, at least for the first months.

```toml
# pyproject.toml
[tool.black]
skip-string-normalization = true
```

## How to enable black for tox users

As examples are usually easier to read than literacy, check:

```ini
# tox.ini
[tox]
envlist = linters,...

[linters:env]
deps =
    black
    flake8
    flake8-black
commands =
    black  # you want black before flake8
    flake8
```

## How to enable black for pre-commit users

If you are using pre-commit to run various linters, you should have something
like this:

```yaml
# .pre-commit-config.yaml
---
repos:
  - repo: https://github.com/python/black.git
    rev: 19.10b0
    hooks:
      - id: black
        language_version: python3
  - repo: https://gitlab.com/pycqa/flake8.git
    rev: 3.7.9
    hooks:
      - id: flake8
        additional_dependencies:
          - flake8-black>=0.1.1
        language_version: python3
```

## Adoption on multiple repositories

Adopting black by bigger organizations and teams should not be seen as a task
for a specific sprint. Its adoptions should be gradual, like one or two
repositories per sprint, starting with the smaller ones first.

The less code you have on a repository the better, the less amount of incoming
changes you have, the better. Do these repositories first and let others
acclimatize with it.

For a bigger code, it may worth doing the reformatting in partial
chunks, especially merging these will require rebasing existing
proposed changes.

[tox]: https://pypi.org/project/tox/
[psf]: https://www.python.org/psf/
[autopep8]: https://pypi.org/project/autopep8/
[flake8]: https://pypi.org/project/flake8/
[black]: https://github.com/psf/black
[hacking]: https://pypi.org/project/hacking/
[pre-commit]: https://pypi.org/project/pre-commit/
[users]: https://github.com/psf/black#used-by
[OpenStack]: https://www.openstack.org/
[yapf]: https://github.com/google/yapf
