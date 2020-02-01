---
title: Managing Release Notes for Python Projects
date: 2020-02-01
categories:
  - python
description: >-
  An attempt to compare various ways of dealing with release notes and changelogs for python projects.
url: /python/release-notes
---

Places where we may want to expose the release notes:

* PyPI project description page, but most projects do not list
  changelogs there unless they happen to keep them in their main README.
* GitHub Releases page, a very good place to see what is new, also allowing you to watch new releases on that project.
* Published documentation

## Git changelog does not replace release notes

Looking at git changelog is not the most fulfilling experience as it
can contain too much noise, like multiple attempts to reconfigure CI, lots
of gradual changes that do not worth mentioning like fixing linting rules.

Most users of a package want to see meaningful changes, sorted by how important
they are.

## Producing release notes on each change

Many projects spend a considerable amount of time building documentation for
how you are supposed to contribute to a project, including writing some
release notes.

While I can understand the reasons, this seems like a potential overkill for
occasional contributors, especially for new contributors. It creates a barrier
and I seen multiple cases where perfect valid contributions never materialized
because they missed meeting the changelog requirements.

This is why I am inclined to look for a solution that allows project maintainers
to edit release notes without slowing down the flow of incoming changes.

## Static CHANGELOG

## TownCrier

[TownCrier] is a project gaining popularity and relies on building fragments. Still with only a bit over 200 stars and
under a single person control, it will need more time to prove itself.

## Reno

[Reno] is the official release note managing platform used by OpenStack. This makes the tool popular among lots of
Python developers. As the project is not hosted on GitHub I cannot state how its popularity outside OpenStack. [Reno issue tracker] does not seem very active either but this may only be a sign of maturity.

## Release-Drafter on GitHub

[Release Drafter] is a GitHub App (or Action) which updates release notes for you.
It is not bugfree but so far it proved to be the one that requires a minimal
maintenance burden, and avoids clogging your CI with release note changes.

Git hub allows maintainers to edit PR names, descriptions and labels
even after PRs are merged. This creates the opportunity to easily rebuild
the release notes until you are pleased with the results.

[TownCrier]: https://pypi.org/project/towncrier/
[Release Drafter]: https://github.com/release-drafter/release-drafter
[Reno Issue tracker]: https://storyboard.openstack.org/#!/project/933
[Reno]: https://docs.openstack.org/reno/latest/
