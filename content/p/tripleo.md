---
layout: page
mermaid: true
---
# TripleO CI Projects

A hard dependendency is created when one project cannot be used or tested
without needing code from the other one.

{{<mermaid>}}
graph LR;

    subgraph openstack

    tci --> tq
    tci --> ta
    tci --> tht
    tci --> tv
    tci --> td
    tci --> tc
    tqe --> tq
    tq --> tc
    tqe --> tc
    tqe --> tu
    arr --> tu
    ta --> toa
    ptc
    tr
    tcdg
    tcij

    end
    subgraph internal
        tenv --> ansible-role-tripleo-overcloud
        tenv --> ansible-role-tripleo-overcloud-validate
        tenv --> ansible-role-tripleo-tempest
        tenv --> ansible-role-tripleo-overcloud-upgrade
        tenv --> ansible-role-tripleo-inventory
        tenv --> ansible-role-tripleo-undercloud-post
    end

    tc[tripleo-common]
    arr[ansible-role-tripleo-ci-reproducer]
    ptc[python-tripleoclient]
    ta[tripleo-ansible]
    tci[tripleo-ci]
    tcij[tripleo-ci-internal-jobs]
    td[tripleo-docs]
    tenv[tripleo-environments]
    tht[tripleo-heat-templates]
    toa[tripleo-operator-ansible]
    tq[tripleo-quickstart]
    tqe[tripleo-quickstart-extras]
    tr[tripleo-repos]
    tcdg[tripleoclient-distgit]
    tu[tripleo-upgrade]
    tv[tripleo-validations]
{{</mermaid>}}
