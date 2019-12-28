---
title: Using a remote docker
date: 2019-03-21
url: /molecule/using-a-remote-docker
description: >-
  Describes on how you can still make use of docker while not having to install
  docker on your own machine.
categories:
  - molecule
tags:
  - ansible
---

Whatever if you are using an operating system that does not support docker or you do not want overload your main desktop with docker service you should know that there is a very easy way of doing it.

Docker added remoting support via ssh few years back but they missed to advertise it others. Mainly you can build and run containers on a remote host almost identically as you would do with a local one.

Just add this to your `~/.bash_rc` file: 

```bash
export DOCKER_HOST=ssh://n0.sbarnea.com
```

Assuming that you can ssh to that remote machine, docker commands that you call from you machine will be executed remotely.

```bash
>docker ps
# lists containers from remote machine!

>docker pull fedora:latest
# this will happen remotely too
```

If you are using Python code that uses [python-docker](https://pypi.org/project/docker/) api, this will also be working. 

My main desktop is MacOS where I didn't want to run container on, epecially during testing as I don't like to hear the CPU fans. I have being using this with [molecule](https://github.com/ansible/molecule/) for more than 6 months.

Sadly podman does not yet has remoting support like docker but it is getting there.

