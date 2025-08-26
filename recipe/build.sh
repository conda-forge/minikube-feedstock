#!/bin/env bash

set -ex

export GOPATH="${BUILD_PREFIX}/bin"
export GOROOT="${BUILD_PREFIX}/go"

make

mkdir -p $PREFIX/bin

mv out/minikube $PREFIX/bin

go-licenses save $SRC_DIR --save_path="./license-files/"