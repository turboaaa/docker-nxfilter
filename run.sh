#!/bin/bash
test='/nxfilter/conf'

##Check if files exist. Create if needed.
[ ! -d ${test} ] && mv /usr/src/nxfilter_base/* /nxfilter && chown -R nxfilter:nxfilter /nxfilter

##Run nxfilter
su nxfilter /nxfilter/bin/startup.sh
