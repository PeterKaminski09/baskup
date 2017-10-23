# 🎉 Baskup is now an OS X desktop application! 🎉
## Download @ http://peterkaminski09.github.io/baskup/ 
### *Last updated: 10/23/2017*

Download the MacOS app for contact recognition, timestamps, and automated backups (coming soon)

*Most future improvements to Baskup will only be available on the desktop version.*

## What is Baskup?

Baskup is a bash script that is aimed at taking your iMessages, which Apple stores on your local machine in non-readable iChat files, and copying them into human-readable text files.
Whether it's a group message, picture, audio file, iMessage, or SMS, Baskup will back it up.

## Why baskup? 

Baskup furthers the work of https://github.com/kyro38 's iMessage backup script by reducing the need for user input and backing up all of the user's messages. 

## How do I use Baskup? 

To use baskup:

Download Baskup from this page by clicking download zip in the top right corner and then unzip the download

From terminal:

![alt tag](https://cloud.githubusercontent.com/assets/5935411/8760632/23ce21b8-2cee-11e5-80d7-37c97505cd17.JPEG)

1. Run: cd (path of the downloaded baskup folder, i.e *cd ~/Downloads/baskup-master*)

2a. Run: *bash baskup.sh* to only backup messages
2b. Run: *bash baskup.sh -a* to backup messages AND attachments

Your bask-up master folder will now begin to be filled with your backups. This may take some time, so be patient. 


## All done
![alt tag](https://cloud.githubusercontent.com/assets/5935411/8760633/272d34c0-2cee-11e5-87c7-084d3bc8f21f.png)


#### Each folder will be named after the contact's phone number. Group chat's will be identified as "chat XYZ"

![alt tag](https://cloud.githubusercontent.com/assets/5935411/8760635/29201a04-2cee-11e5-9cc7-668b6a6e5ee0.png)

#### Within each directory you will find a directory for the attachments from that message, and the actual message text file. 

## Opening an issue

When opening an issue, please note the issue as either related to the bash script or the macOS version of baskup. For macOS, please include the version number in your issue log. 

## Contributing
Open source contributions to this script are welcome! This project is currently being maintained by @peterkaminski09 and has contributions from @timegaleckas and @Pezmc
