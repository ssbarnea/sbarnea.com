---
title: Gerrit Reduced Interface
description: >-
  GRI is a command line tool I created over a weekend for helping me with code
  reviews across multiple Gerrit Servers.
categories:
  - tools
tags:
  - cli
  - gerrit
  - git
date: 2019-09-06
---

## What it does?

[GRI](https://github.com/pycontribs/gri) lists reviews in a compressed format which also allows you to click either review number of topic to open them in your browser, if your terminal supports hyperlink extension.

![gri screenshot made with v0.3](/content/gri-screenshot.png)

Since I created that tool the  number of open reviews I had went down considerably and I suspect that its ability to focus on reviews that are likely to merge or to be abandoned helps cleaning up the queus.

## Why not improving GerTTY?

[GerTTY](https://github.com/openstack/gertty) is lovely and improving it would have being my first choice but at this moment I would evaluate it as "unmaintained", or at least not an active project. I would not have a chance of introducing major changes like consolidating reviews from multiple servers.

If you ever used [GerTTY](https://github.com/openstack/gertty) you probably know that it supports multiple servers, but it does this in a way that requires you to start a different instance for each server. There is effectively no way to see all reviews in a single terminal window. This was a deal-breaker for me.

## Minimal configuration

Shortly, at this moment there is no configuration file for [`gri`](https://github.com/pycontribs/gri), as it loads Gerrit servers from `~/gertty.yaml` config, with one caveat credentials are loaded from `~/netrc` file. That was my decision as I found the idea of storing credentials in a single place, different than tool config safer.

To install it just run `pip install gri`

### CLI Options

By default [`gri`](https://github.com/pycontribs/gri) will list only your own reviews. To display incoming ones add `-i` . Debug mode will print `json` received from gerrit.

```bash
$ gri --help                                                                                                                                                              [11:33:34]
Usage: gri [OPTIONS]

Options:
  -d, --debug        Debug mode
  -i, --incoming     Incoming reviews (not mine)
  -s, --server TEXT  Query a single server instead of all
  --help             Show this message and exit.
```

The `-s` option is the most recent addition, and allows you to query only one server. If you do `-s0`it will query only the first server from your config. It proved to be quick way to focus on reviews from a single server.

### Sorting order

The sorting order is not configurable yet and is based on a scoring system which values more reviews that are closer to being merged and that penalizes reviews that are unlikely to be ready to merge. So down-votes from users of CI, draft/wip/dnm statuses or merge conflicts do all lower the score value.

### Future development

You are welcomed to contribute new features to it, in the end is mare out out about 100 lines of python code. Before implementing a new feature is would better to[ create a bug](https://github.com/pycontribs/gri/issues) that describes the problem and the desired solution, based on this we can see if we can change its default behavior or make the new feature optional.
