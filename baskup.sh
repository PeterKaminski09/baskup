#!/bin/sh

#  baskup.sh
#  
#
#  Created by Peter Kaminski on 7/17/15. http://github.com/peterkaminski09
#
#  This script will back up all of your imessages to a directory in home.

#Go into the messages database and output all contact phone numbers to the tmp folder
sqlite3 ~/Library/Messages/chat.db <<ENDOFSQL>/tmp/dumped.txt
select * from chat;
ENDOFSQL

#Now we need to run the python script that will parse this file and store all phone numbers
cd

#IMPORTANT: THIS SHOULD BE THE DIRECTORY OF YOUR BASKUP DOWNLOAD. If you have moved baskup to your desktop, it may need to be ./Downloads/baskup-master. Just keep this in mind
cd ./Downloads/baskup-master
python parseContacts.py

bash backUpMessages.sh /tmp/pyContacts.txt