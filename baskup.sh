#!/bin/sh

#  baskup.sh
#  
#
#  Created by Peter Kaminski on 7/17/15. http://github.com/peterkaminski09
#
#  This script will back up all of your imessages to a directory in home.

sqlite3 ~/Library/Messages/chat.db "select guid from chat" | bash backUpMessages.sh