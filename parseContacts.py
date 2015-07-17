#!/usr/bin/env python

chatDump = open('/tmp/dumped.txt')

print(chatDump)

#Array of contacts numbers which we will be parsing
contactsArray = []
count = 0
#print(split('|'))
for line in chatDump:
    contactsArray += [line.split('|')[1]]
    count += 1

#Output our results to a tmp file
output = open('/tmp/pyContacts.txt', "w+")
#Write the file line by line
for value in contactsArray:
    output.write(value+"\n")



