#!/bin/bash

dsconfigldap -a your.odmaster.com 

sudo dscl /Search -create / SearchPolicy CSPSearchPath

sudo dscl /Search -append / CSPSearchPath /LDAPv3/your.odmaster.com

exit 0