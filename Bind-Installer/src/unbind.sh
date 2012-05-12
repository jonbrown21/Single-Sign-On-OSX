#!/bin/bash

echo -n "Enter the short name of the user are you migrating? "

read -e MUSER

echo "Step 1 - Beginning the unbinding process"

sudo dscl -q localhost -delete /Search CSPSearchPath /LDAPv3/your.odmaster.com

sudo dscl -q localhost -delete /Search CSPSearchPath /LDAPv3/your.odmaster.com

echo "   Status: Success."

echo ""

echo "Step 2 - User removed from LDAP directory"

sudo dsconfigldap -u username -p 'password' -s -f -r your.odmaster.com -c $HOSTNAME

sudo dsconfigldap -u username -p 'password' -s -f -r your.odmaster.com -c $HOSTNAME

echo "   Status: Success."

echo ""

echo "Step 3 - Removing preference files"

sudo rm -r /Library/Managed\ Preferences

echo "   Status: Success."

echo ""

sleep 5

echo "Step 4 - Moving user account from Network to Local"

mv /Users/Shared/$MUSER.plist /var/db/dslocal/nodes/Default/users/

echo "   Status: Success."

echo ""

sleep 5

echo "Step 5 - Identifying the migrated user account ($MUSER)"

id $MUSER

echo "   Status: Success."

echo ""

sleep 5

echo "Step 6 - Restarting the Directory Service"

killall DirectoryService

sleep 10

echo "   Status: Success."

echo ""

echo "Step 7 - Double checking user account assignment ($MUSER)"

id $MUSER

echo "   Status: Success."

echo ""

sleep 5

echo "Step 8 - Setting new user account permission levels for $MUSER"

chown -R $MUSER /Users/$MUSER

echo "   Status: Success."

echo ""

sleep 5

echo "$MUSER Successfully unbound from the network"

echo ""

exit 0

