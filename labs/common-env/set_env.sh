#!/bin/env bash

echo "set vault path"
export PATH=$PATH:$PWD

vault version

echo "change to project hashicorp"

oc project hashicorp

export VAULT_ADDR=https://$(oc get route vault --no-headers -o custom-columns=HOST:.spec.host)

export VAULT_SKIP_VERIFY="true"

vault status
