#/bin/sh

for s in $(find . -name "*.h")
do
	file=$(basename $s)
	if echo $file | sed -e 's/\(.\)/\1\n/g' | grep -E "[A-Z]" > /dev/null ; then
		lowered=$(echo $file | tr '[:upper:]' '[:lower:]')
		if temp=$(grep -R -E -l "#include*$lowered*" *) && echo $temp | xargs sed -i "s/$lowered/$file/g"; then
			echo " Replaced $lowered by $file in : "
			echo "$temp"
		fi
	fi
done

for s in $(find . -name "*.cpp")
do
	file=$(basename $s)
	if echo $file | sed -e 's/\(.\)/\1\n/g' | grep -E "[A-Z]" > /dev/null ; then
		lowered=$(echo $file | tr '[:upper:]' '[:lower:]')
		if temp=$(grep -R -E -l "#include*$lowered*" *) && echo $temp | xargs sed -i "s/$lowered/$file/g"; then
			echo " Replaced $lowered by $file in : "
			echo "$temp"
		fi
	fi
done
