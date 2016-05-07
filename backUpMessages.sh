#!/bin/sh


cd "`dirname "$0"`"
path_scriptdir="`pwd -P`"
TMPDIR="$path_scriptdir"'/tmp'


#Read all information that our python script dug up
while IFS='' read -r line || [[ -n "$line" ]]; do
    contact="$line"
    arr_in=(${contact//;/ })
    contact_number="${arr_in[2]}"

    path_contact="$TMPDIR"/"$contact_number"
    path_attachments="$path_contact"'/attachments'

    mkdir -p "$path_contact" && cd "$path_contact"
    sqlite3 ~/Library/Messages/chat.db "
    select is_from_me,text from message where handle_id=(
        select handle_id from chat_handle_join where chat_id=(
            select ROWID from chat where guid='$line'
        ))" | sed -e 's!^1\(.+\)$!M\1!' \
                  -e 's!^0\(.+\)$!Y\1!' \
            | tr '|' '\t' \
            > "$line".txt \
        || exit 1

    mkdir -p "$path_attachments" && cd "$path_attachments"
    sqlite3 ~/Library/Messages/chat.db "
    select filename from attachment where rowid in (
        select attachment_id from message_attachment_join where message_id in (
            select rowid from message where cache_has_attachments=1 and handle_id=(
                select handle_id from chat_handle_join where chat_id=(
                    select ROWID from chat where guid='$line'
    ))))" | tr '\n' '\0' | sed -e 's!~/!'"$HOME"/'!g' | xargs -0 -t -I{} cp {} . \
        || echo "Fail!"
    #| xargs -0 -t -I{} echo {} \
done < "$1"

