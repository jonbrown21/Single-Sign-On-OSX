#!/bin/bash

echo -n "Enter the short name of the user are you migrating? "

read -e MUSER

dsconfigldap -a your.odmaster.com

sleep 2

sudo dscl /Search -create / SearchPolicy CSPSearchPath

sudo dscl /Search -append / CSPSearchPath /LDAPv3/your.odmaster.com

dsconfigldap -a your.odmaster.com 

sleep 2

sudo dscl /Search -create / SearchPolicy CSPSearchPath

sudo dscl /Search -append / CSPSearchPath /LDAPv3/your.odmaster.com

sleep 5

echo "Step 6 - Moving user account from Local to Network"

mv /var/db/dslocal/nodes/Default/users/$MUSER.plist /Users/Shared/

echo "   Status: Success."

echo ""

sleep 5

echo "Step 7 - Identifying the migrated user account ($MUSER)"

id $MUSER

echo "   Status: Success."

echo ""

sleep 5

echo "Step 8 - Restarting the Directory Service"

killall DirectoryService

sleep 15

echo "   Status: Success."

echo ""

echo "Step 9 - Double checking user account assignment ($MUSER)"

id $MUSER

sleep 5

echo "   Status: Success."

echo ""

echo "Step 10 - Setting new user account permission levels for $MUSER"

chown -R $MUSER /Users/$MUSER

echo "   Status: Success."

echo ""

echo "$MUSER Successfully bound to the network"

echo ""


exit 0