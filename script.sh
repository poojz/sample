#t= "password=345"
scan()
{
	url_without_suffix="${url%.*}"
	reponame="$(basename "${url_without_suffix}")"
	b="/*"
	c="$reponame$b"
	echo $c
	for file in sample/*; do
		echo $(basename "$file")
		f="(password|pass|server_password)([^/]+)"
		for i in `cat $file`
		do
			m=$i
			if  [[ $m =~ $f ]]
			then
				echo $i
				echo -e "\e[00;31mPASSWORD FOUND!\e[00m in \e[\033[01;33m$(basename "$file")\e[00m "
				break
			fi	
		done 
	done
}
myfunc()
{
	echo "enter the url of the repository"
	read url
	git clone $url
}
