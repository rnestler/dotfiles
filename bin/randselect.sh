#/bin/bash

i=0
mkdir -p ~/tmp/list/
#ls *.pdf |sort -R|head -n4 | while read file; do

ls -1 $@ | while read file; do
	echo "$file" "~/tmp/list/$i.pdf"
	pdfcrop --margins 5 --clip "$file" ~/tmp/list/$i.pdf
	let i=i+1
done

