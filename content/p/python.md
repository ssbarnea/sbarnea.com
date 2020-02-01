---
layout: page
mermaid: true
sidebar: left
foo: https://learn.netlify.com/en/shortcodes/mermaid/
---

# Python projects

This page describes Python projects I often use, on some of them being
a maintainer.

## Linters

{{<mermaid>}}

graph LR;

    ansible-lint --> ansible

    pre-commit -.-> flake8
    pre-commit -.-> doc8
    pre-commit -.-> bandit
    pre-commit -.-> bashate
    pre-commit -.-> yamllint
    pre-commit -.-> ansible-lint
    pre-commit -.-> zuul-lint

    flake8 -.-> flake8-black
    flake8 -.-> flake8-mypy
    flake8 -.-> flake8-docstrings
    flake8 -.-> flake8-absolute-import
    flake8 -.-> mccabe
    flake8 -.-> pyflakes

    flake8-black --> black
    flake8-mypy --> mypy
    flake8-docstrings --> pycodestyle

    flake8 -.-> hacking
    yamllint --> pyyaml
    yamllint --> ruamel.yaml

    zuul-lint --> pyyaml

    classDef core fill:#f9f,stroke:#333,stroke-width:1px;
    class doc8 core;
    class ansible-lint core;
    class zuul-lint core;

{{</mermaid>}}

{{<todo>}}
    click tox "https://github.com/tox-dev/tox" "source";
    click pre-commit "https://github.com/pre-commit/pre-commit" "pre-commit";
    click git-review "https://opendev.org/opendev/git-review" "git-review";
    click flake8 "https://github.com/PyCQA/flake8" "flake8";
    click pytest-molecule "https://github.com/ansible-community/pytest-molecule" "pytest-molecule";
    click molecule "https://github.com/ansible/molecule" "molecule";
    click selinux "https://github.com/pycontribs/selinux" "selinux";
{{</todo>}}

## Unit and functional testing

{{<mermaid>}}
graph LR;

    tox --> pytest
    tox --> stestr
    tox --> sphinx

    molecule --> ansible
    molecule -.-> selinux
    molecule -.-> docker
    molecule -.-> libpod
    molecule --> cookiecutter
    molecule --> testinfra

    subgraph pytest*
        pytest -.-> pytest-molecule
        pytest -.-> pytest-html
        pytest -.-> pytest-sugar
        pytest -.-> pytest-cov
        pytest -.-> pytest-xdist
    end

    pytest-html -.-> ansi2html
    pytest-molecule --> molecule

    pytest-cov --> coverage

    sphinx
    stestr --> python-subunit
    stestr --> testtools
    stestr --> voluptuous

    classDef core fill:#f9f,stroke:#333,stroke-width:1px;

    class pytest-molecule core;
    class molecule core;
    class selinux core;
    class cookiecutter core;
    class testinfra core;
{{</mermaid>}}

## Packaging

{{<mermaid>}}
graph LR;

    pip --> wheel
    pip --> setuptools
    twine --> wheel
    twine --> setuptools
    pbr --> setuptools
    virtualenv --> pip
    reno
    setuptools --> setuptools-scm
{{</mermaid>}}

## Other tools or libraries

{{<mermaid>}}
graph LR;
    git-review
    jenkins-job-builder --> python-jenkins
    jira
{{</mermaid>}}
