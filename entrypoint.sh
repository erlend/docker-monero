#!/bin/bash

[ -z $1 ] && set -- --help
[ ${1:0:1} = '-' ] && set -- ./monerod $@

exec $@
