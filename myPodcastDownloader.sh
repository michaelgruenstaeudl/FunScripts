for channel in $(cat mychannels.txt | awk '{print $1}')
do
	latestVideos=$(wget -qO- "$channel" | grep "https://www.youtube.com/watch?v" | head -n5 | sed -e 's/.*href=\"\(.*\)\".*/\1/')
	for video in $(echo "$latestVideos")
	do 
		youtube-dl -f 140 "$video"
	done
done

#for f in *.m4a
#do
#	if "`find $f -mmin +30`"
#	do
#		LC_ALL=C tr -dc '\0-\177' <$f >$f.new.txt
#	done
#done
