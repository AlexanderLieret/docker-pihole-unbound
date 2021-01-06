#!/bin/bash -e
/etc/init.d/unbound start
exec /s6-init
