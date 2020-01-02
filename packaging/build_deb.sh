#!/bin/bash
set -e
_dir=`dirname "$(readlink -f "${0}")"`
_basedir=${_dir}
cd ${_basedir}/debian
fakeroot debian/rules binary
