#!/bin/bash

PACKER_ENV=Ubuntu

cd ./env/$ENV/$PACKER_ENV
packer validate packer.json