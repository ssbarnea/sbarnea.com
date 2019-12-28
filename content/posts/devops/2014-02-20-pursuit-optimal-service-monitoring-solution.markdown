---
categories:
- devops
date: "2014-02-20T00:00:00Z"
published: true
status: publish
tags:
- datadog
- monitoring
- devops
- SaaS
- nagios
- icinga
- zabbix
title: Looking for the optimal service monitoring solution
---
As soon I deployed my first web application, I realised that I will need a simple and effective way to watch it. A tool that would allow me to track the performance over time and at the same time to let me know if something goes wrong. <!--more-->

Over the years, I used Nagios, but I always found it hard to configure and hard to adapt. It wasn't user-friendly and clearly not a low maintenance tool. Considering that Nagios has a commercial variant it explains a lot why it became, or remained, stuck in the past, where accessibility and usability were just fancy words. I do not have time to deal with all the problems Nagios has, and I do not have the time to wait for the IT department to implement the changes that I need. Usually by the time the change is implemented, if this ever happens, the requirements are already changed. During the last two weeks, I've spent a considerable amount of time trying to find a monitoring tool that can easily be reconfigured from a web interface.

My requirements were quite simple, no need to scale the number of machines too much, below 20 should be enough, but I do need:

 * native metering support for JVM, PostgreSQL, Nginx, MySQL, Tomcat.
 * easy to add or remove hosts
 * easy change of alert levels, it's common to change JVM memory settings and I need to be able to change the alert levels in two clicks.
 * self-service based, so each user can add his own stuff

So, after evaluating: [Nagios](https://www.nagios.org) [Zabbix](https://zabbix.com/) [Icinga](https://www.icinga.org) and [OpenNMS](https://www.opennms.org), I was ready to give up, and to decide that I need to quit my cool DevOps job, and try to make a new monitoring product. One that is easy to deploy and use, one that can really be used as self-service by anyone in a company, without having to beg a sys-admin to make a change to it.

I was restrained from going for a hosted SaaS solution because usually, if you look behind the main pricing page, they are extremely expensive, or unreliable.

I checked quite a few and decided to try one that would have a decent free plan and that would aim to provide all my metrics without me having to script the metric collectors... I still have nightmares with Zabbix and OpenNMS configurations for basic JVM monitoring.

After checking few other solutions, I decided to test [DataDog], 5 servers with up to 100 metrics for each, with only one day of history and no alerts seemed a decent free plan, even if the full one would be $15/month/host, or $180 per year/host -- quite a big price for someone that keeps most services on different VMs.
<!--
[![DataDoghg.com dashboard screenshot](https://sbarnea.com/wp-content/uploads/2014/02/datadog-screenshot-300x161.jpg)</a>](https://sbarnea.com/wp-content/uploads/2014/02/datadog-screenshot.jpg) -->

Anyway, what I wanted to say is that I'm not easy to impress, I would say that I'm quite high-demanding, but I was still astonished by the product:

*   one line installer for any platform (worked 9/10, and when it failed it was because apt-get was broken on that machine, not their fault)
*   zero configuration, you will start seeing the metrics in seconds after the service started
*   additional metrics like JVM, database or Nginx can be enabled with minimal efforts, just by renaming a ``.yaml`` file and editing one or two lines in it, usually writing the port number.
*   the web UI is top of HTML5, made with accessibility and usability in mind, exactly the opposite of Nagios.
*   also impressed about the support; that's something you always have to try in order to see if the staff is well skilled and if they are doing their best not only to solve your request but also to improve the product (5* here)

As a short side story, I remember filing a bug on Nagios, complaining about the iframe that prevents you from sending a link to someone, or that alters the behavior of the browser back or refresh functionality. Here is their answer: we do not have any plans on fixing this. I also reported that you cannot click any notifications links from email notification, for service names that do have space in them. The URLs are broken because they are not escaped : if you have any Apple email client or Outlook for Mac, you probably know what it mean. This one was filed in December 2012, remained untouched.

So, I'm still evaluating DataDog, but I'm already in-love after only one day.

I would like to hear your experiences, maybe with other solutions, but keep in mind: I don't want to hear about things that do require a significant amount of time to configure or reconfigure, I don't want to make service monitoring configuration part of my job description :)

<!-- ![](https://sbarnea.com/wp-content/uploads/2014/02/datadog-screenshot.jpg) -->