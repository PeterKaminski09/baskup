#!/bin/sh

#  baskup.sh
#  
#
#  Created by Peter Kaminski on 7/17/15. http://github.com/peterkaminski09
#
#  This script will back up all of your imessages to a directory in home.

#Go into the messages database and output all contact phone numbers to the tmp folder
sqlite3 ~/Library/Messages/chat.db <<ENDOFSQL>/tmp/dumped.txt
select guid from chat;
ENDOFSQL

bash backUpMessages.sh /tmp/dumped.txt