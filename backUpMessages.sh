#!/bin/sh

#  backUpMessages.sh
#  
#
#  Created by Peter Kaminski on 7/17/15.
# Main code can be found at https://github.com/kyro38/MiscStuff/blob/master/OSXStuff/iMessageBackup.sh
# However I have tweaked it a bit to optimize the result

# Read contacts from stdin.
while read line; do
arrIN=(${line//;/ })
contactNumber="${arrIN[2]}"
#Get to the home directory
cd
#This path should be the same as the path you use in baskup.sh
cd ./Downloads/baskup-master
#Make a directory specifically for this folder
if [[ ! -e "$contactNumber" ]]; then
	mkdir "$contactNumber"
fi
#Now get into the directory
cd "$contactNumber"
#Perform SQL operations
sqlite3 ~/Library/Messages/chat.db "
select is_from_me,text, datetime(date + strftime('%s', '2001-01-01 00:00:00'), 'unixepoch', 'localtime') as date from message where handle_id=(
select handle_id from chat_handle_join where chat_id=(
select ROWID from chat where guid='$line')
)" | sed 's/1\|/Me: /g;s/0\|/Friend: /g' > "$line.txt"

cd
cd "./Downloads/baskup-master/$contactNumber"
if [[ ! -e "Attachments" ]]; then
	mkdir "Attachments"
fi
#Retrieve the attached stored in the local cache

sqlite3 ~/Library/Messages/chat.db "
select filename from attachment where rowid in (
select attachment_id from message_attachment_join where message_id in (
select rowid from message where cache_has_attachments=1 and handle_id=(
select handle_id from chat_handle_join where chat_id=(
select ROWID from chat where guid='$line')
)))" | cut -c 2- | awk -v home="$HOME" '{print home $0}' | tr '\n' '\0' | xargs -0 -t -I fname cp fname Attachments/
find . -type d -empty -name "Attachments" -delete
done