---
title: Mastering YAML
slug: yaml
url: /ansible/yaml-syntax
date: "2019-02-16"
description: >-
  YAML was designed to be simple but guess what, there are few important
  features that are very badly documented.
categories:
  - ansible
tags:
  - YAML
permalink: /ansible/yaml-syntax
---

While YAML may seem to be a very simple file format it also hides a serious
amount of complexity, one that is poorly documented. That is my attempt to
clarify few of these things.
<!--more-->

## Anchors

Anchors allow you to avoid repeating yourself inside the **same** YAML document. They are expended by the loader.

```yaml title="sample.yaml"
--
john: &myanchor
  age: 30
  sex: male
mary:
  <<: *myanchor
  sex: female
# when loaded mary.age will be '30'
```

> Keep in mind that you can use them only with dictionaries.

## Booleans

While there are many ways to specify boolean values in YAML files, there are only two recommended values to use:

```yaml
foo: true
bar: false
```

## Blocks

As soon you have to write longer strings, you will need to learn about blocks and how they are rendered.

```yaml
literal_block: |
    this is first line
    this is 2nd line

# lines are joined with a space in between
folded_block: >  # valid yaml comment
    I have a big
    dog.  # this is not a comment, gets into string
```

> Keep in mind that blocks alter how comments work in YAML so inside a block body you cannot use comments as they will become part of the loaded string.

## Other features

I need to mention tags which are used for more advanced stuff, like loading custom objects, encrypted data. You need to know that they depend on the application loading the file.

References

* [https://learnxinyminutes.com/docs/yaml/](https://learnxinyminutes.com/docs/yaml/)
