#!/bin/env bash

set -euxo pipefail

# Disable CGO except on linux-64 where the KVM driver needs it
# KVM driver has build constraint "linux && amd64" and requires libvirt CGO bindings
if [[ "${target_platform}" == "linux-64" ]]; then
    export CGO_ENABLED=1
else
    export CGO_ENABLED=0
fi

make

mkdir -p $PREFIX/bin

mv out/minikube $PREFIX/bin

go-licenses save $SRC_DIR/cmd/minikube --save_path="./license-files/"
