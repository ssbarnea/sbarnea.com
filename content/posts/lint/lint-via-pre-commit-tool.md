---
date: 2019-01-01
title: Lint via pre-commit tool
---

As a developer I always found annoying to have to wait a long minutes or hours in order to get a CI build failure caused by some linting errors. Or those cases where you spot the errors in commit message after you push.

On the other hand, running linters and unit-tests before making any contribution is usually included in the documentation. We do know very well that we often forget to do it. I cannot blame the user, nobody sane wants to keep his mind focused on boring repetitive tasks, we have computers to do this for us. 

Git hooks are not something new and they were a pain to setup on either server or client side, for different reasons. On the server side you usually have no control to install hooks or is too risky to install them. On the client side the big challenge was how to manage them and distribute them to the developers. For security reasons git itself would never install or run something when you do `git clone`. 

Lucky for us, there is a solution which now looks mature. I am quite picky when it comes to adopting a new shiny tool, as it also means a possible new point of failure in your workflow. 

What [openstack hacking](https://github.com/openstack/hacking) did to `flake8`, is mostly what [`pre-commit`](https://pre-commit.com) does to any linter. Mainly it **orchestrates linter**, making them reproducible and easy to use. It also ease the process of updating linters. 

If you want to upgrade linters, just run `pre-commit autoupdate`, which will check if new versions are available and update configuration to point to them. If you like the result you commit the new config. 

## Why pre-commit when we can tox? 

To ruin the debate: I am using pre-commit via tox on all projects. Even tox itself is using pre-commit.

Without pre-commit, tox would install linters on a virtualenv, most of the time each on a different environment and this takes a lot of time. 

On tox, if you happen to bump version in test-requirements.txt, you will most likely fail to get the new ones installed because tox fails to detect changes in that file, unless you remember to do a `tox -r …` 

What pre-commit does under the hood is that cloning and installing each linter on its internal user-level cache. It means that if you use `flake8==1.2.3` on one hundred repositories instead of having it installed in each virtualenv on each repository, it will be installed in a single place, once. If you are curious about how the cache looks, check `~/.config/pre-commit`. Feel free to wipe it and see how it will slowly be repopulated in time. 

Another benefit of pre-commit is that it can install and run linters that are not python based, like nodejs ones for example.

## How do I add a new linter? 

Enabling a new linter is as easy as just adding a simple yaml file to the linter repository, nothing more. 

Which linters already support pre-commit? Hard to say but I found all those that mattered to me: 

* [Ansible-lint ](https://github.com/ansible/ansible-lint)
* [Yamllint](https://github.com/adrienverge/yamllint)
* [Bashate](https://github.com/openstack/bashate)
* [Flake8](https://github.com/PyCQA/flake8) - python
* [Black](https://github.com/psf/black) - python reformatter
* [Doc8](https://github.com/PyCQA/doc8) - ReSTructured Text
* Spell-checking \(work in progress to enable cspell\) 

Few tricks to remember before you do decide to try it yourself

 `pre-commit run` does linting only of the last commit, being extremely fast. 

`pre-commit run --all-files` does a global linting, something that you would want on a CI gate. 

There is nothing preventing you from continuing to run tox with linters listed in your test-requirements.txt file but there are few gotchas you need to be aware about.

If you want to avoid surprised where local run give different results than running on ci, you better call pre-commit from inside tox. You should migrate your linters from `test-requirements.txt` to `.pre-commit-hooks.yaml` and specify only `pre-commit` as a test requirement. Inside `tox.ini` you would just be calling pre-commit which will do your job. 

For example one issue that I found on few projects was that they had flake8 config inside `tox.ini` instead of `setup.cfg` and thus `flake8` executed by pre-commit missed to load config from `tox.ini`. Solution was very simple: moving the config to its recommended location `setup.cfg`. 

Most linters do allow you to specify their configuration inside the yaml file but I prefer to keep those outside whenever is possible, allowing me to call the tool directly when I want. 

Few examples of python projects where I successfully adopted pre-commits: 

* [jira](https://github.com/pycontribs/jira/blob/master/.pre-commit-config.yaml)
* [python-jenkins](https://opendev.org/jjb/python-jenkins/src/branch/master/.pre-commit-config.yaml)
* [jenkins-job-builder](https://opendev.org/jjb/jenkins-job-builder/src/branch/master/.pre-commit-config.yaml)
* [infrared](https://github.com/redhat-openstack/infrared/blob/master/.pre-commit-config.yaml)
* multiple openstack tripleo repositories

You may want to also check the `tox.ini` file to see how they are consuming it on CI. Let me know if you had a good, or bad, experience with it. Also, if you need help adopting it for an openstack project, feel free to let me know, it takes only a couple of minutes to add it.



