#!/bin/sh


cd "`dirname "$0"`"
path_scriptdir="`pwd -P`"
TMPDIR="$path_scriptdir"'/tmp'

mkdir -p "$TMPDIR"


# Go into the messages database and output all contact phone numbers to the tmp folder
tmp_sqldump="`mktemp -t sqldump.XXXXXX`" || exit 1
sqlite3 ~/Library/Messages/chat.db <<-ENDOFSQL > "$tmp_sqldump"
	select * from chat;
ENDOFSQL


#Now we need to run the python script that will parse this file and store all phone numbers
tmp_parsed="`mktemp -t parsed.XXXXXX`" || exit 1
python parseContacts.py "$tmp_sqldump" "$tmp_parsed"


bash backUpMessages.sh "$tmp_parsed"

