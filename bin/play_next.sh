for (( i=1; i<10; i=i+1 )); do
	if ls $( printf '*[Ss]%02d*' $i ) ; then
		for (( j=1; j<30; j=j+1 )); do

			if ls $( printf '*[Ss]%02d*[Ee]%02d*' $i $j ) ; then
				gnome-mplayer $( printf '*[Ss]%02d*[Ee]%02d*' $i $j )
				mv $( printf '*[Ss]%02d*[Ee]%02d*' $i $j ) Staffel_$i/
				exit
			fi

		done
	fi
done

