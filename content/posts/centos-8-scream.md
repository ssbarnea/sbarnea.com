---
categories:
- devops
date: "2020-12-11T00:09:00Z"
published: true
status: publish
tags:
- docker
- centos
- ubuntu
title: CentOS 8 Scream and containers saga
url: /posts/centos-scream
---

## CentOS 8 Stream scream

December 10th, 2020 started on the wrong foot for me. After I unlocked my computer: my main communication app [TheLounge](https://github.com/thelounge/thelounge), a self hosted web irc client, went offline, the container was no longer running. This was a docker container running on my CentOS 8 Stream homelab server, one configured with unattended upgrades (yes yolo!).

Apparently over the night the upgrade to [Docker 20.10](https://www.docker.com/blog/introducing-docker-engine-20-10/) messed the network stack and the service failed to even start. After wasting more than three hours trying to restore the network stack on docker I decided to switch my containers to another box, a Fedora 33 one.

## Fedora 33

Having Ansible playbooks already written for my homelab made the redeployment quite fast, in less than 15mins I got all the containers running on the new host and reconfigured the router to send traffic to the new host.

All good, for about almost one hour when I realize something strange: TheLounge randomly reconnected with freenode server, at some point irc ping commands stop returning pongs and after 120s. Each disconnect and reconnect, produces an ugly wave of notices in the web interface.

For the rest of the day I tried to focus on work items while while trying to debug the connection resents.

Near the end of the day I made another desperate move: lets try another platform, I still have this ancient macmini coreduo running Ubuntu 20.04 which I only keep it mostly for testing Debian compatibility.

## Ubuntu 20.04

I redeployed the entire suite of containers to my 3rd host. It happens to run the same docker 20.10 release, which should help narrowing down the problem a little bit. All went smooth thanks to my collection of Ansible playbooks, with very few manual steps. While I automation is what I eat and dream, I also learned that not everything should be automated. There is a good number of cases were automation effort is bigger than saved time.

I left it running over the night and this morning reported zero disconnections.

Before anyone starts to wave that I am suggesting that Ubuntu would be a better distro than the previous two, let me clarify: pick your poison carefully, there is no snakeoil... especially if you consider [python3.9 and debian/ubuntu](https://twitter.com/webKnjaZ/status/1337109130058883073)

## Conclusions, containers and contusions

Keep in mind that my homelab works as a canary test platform, one of its main goals is to break quickly. Still, the conclusion was quite sad Docker 20.10 broken both CentOS-8 Stream and Fedora 33 in different ways. Bit hilarious considering that support for these was part of the release news.


I am sure that most of my colleagues will ask me why I was running unsupported, non kosher software instead of being a podperson. The answer to that is more complex but involves lack of good compose replacements, or incomplete remoting support in podman, especially in relation with MacOS.

I do keep posting bugs on podman issue tracker and I am really pleased about how this small team manages to deal with them. As opposed to other projects they do read the bugs and comments on tickets.

Last pain point was the fact that I discovered that using RSA keys do not work for remote authentication in podman. That pushed me to create a more modern ED25519 key and set it as primary, looking forwards to slowly obsolete my ancient RSA 4096 key which dated back to 2015.

Regarding CentOS 8 Stream failure to start docker, the problem proved to be the same that was reported against Fedora with 20.10 at [moby#41609](https://github.com/moby/moby/issues/41609) but keep in mind that I was not running moby, I was running the upstream docker-ce. Still considering that checking if a bridge was already added to a firewall zone is a very basic thing to do, I wonder if Docker Inc did not rush in making the 20.10 release just to meet the already announced community meeting.

The randomly dropped (or stuck?) connections that happen only on Fedora 33 are indeed something very weird. With all the testing done so far, I was not able to identify the exact cause. I did ping the same IRC servers from inside the same running containers for long time and I did not see any package drop.

Based on the irc logs, PING/PONG works all the time and I was not able to see even one case were a 2nd PING was needed and prevented a disconnections. When it stops responding it does for good until the client decides to reconnect, as seen in the snippet below.

```
09:53 *** PING kiwitime-1607594018364
09:53 *** :card.freenode.net PONG card.freenode.net :kiwitime-1607594018364
... (other msg received)
09:54 *** PING kiwitime-1607594048369
09:54 *** PING kiwitime-1607594078381
09:55 *** PING kiwitime-1607594108396
09:55 *** PING kiwitime-1607594138416
09:56 Ping timeout, disconnecting…
09:56 *** QUIT :Ping timeout (120 seconds)
09:56 Disconnected from the network. Reconnecting in 3 seconds… (Attempt 1)
09:56 Connected to the network.
```

I already made tests with other irc servers and my conclusion is that this
issue must be somewhere withing Docker-Fedora networking. And apparently that
happened quite often, around every 30-60minutes on average but without a
clear pattern.

To be updated...
