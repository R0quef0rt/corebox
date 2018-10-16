#!/bin/bash

OS_FAMILY=$1

cd ./env/$ENV/$OS_FAMILY
packer validate packer.json