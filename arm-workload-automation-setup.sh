#!/usr/bin/env bash

# Copyright (c) 2019, University of Kaiserslautern
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# 1. Redistributions of source code must retain the above copyright notice,
#    this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# 3. Neither the name of the copyright holder nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER
# OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# Author: Éder F. Zulian

DIR="$(cd "$(dirname "$0")" && pwd)"
TOPDIR=$DIR
source $TOPDIR/common/defaults.in
source $TOPDIR/common/util.in

$TOPDIR/dep_install.sh

gitrepos=(
"$ROOTDIR:https://github.com/ARM-software/workload-automation.git"
)
greetings
git_clone_into_dir gitrepos[@]

pushd $ROOTDIR/workload-automation
git checkout legacy
sudo -H python setup.py install
wa -h

# See also:
# https://workload-automation.readthedocs.io/en/latest/user_information.html#prerequisites
# https://github.com/ARM-software/devlib
#sudo apt-get install python-pip
#sudo -H pip install --upgrade pip
#sudo -H pip install testresources
#sudo -H pip install --upgrade setuptools
#sudo chmod -R a+r /usr/local/lib/python2.7/dist-packages
#sudo find /usr/local/lib/python2.7/dist-packages -type d -exec chmod a+x {} \;
#sudo -H pip install pexpect
#sudo -H pip install pyserial
#sudo -H pip install pyyaml
#sudo -H pip install docutils
#sudo -H pip install python-dateutil
#sudo -H pip install devlib
#sudo -H pip install pandas
#sudo -H pip install louie
#sudo -H pip install wrapt
#sudo -H pip install requests
#sudo -H pip install colorama
#sudo -H pip install future
#sudo apt-get install python-serial
#sudo -H pip install nose
#sudo -H pip install PyDAQmx
#sudo -H pip install pymongo
#sudo -H pip install jinja2
#sudo -H pip install wa
#sudo -H pip install wa[all]

