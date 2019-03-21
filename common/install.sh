hf () { cp -rv $INSTALLER/custom/HF/* $INSTALLER/system/; }
bf () { cp -rv $INSTALLER/custom/BF/* $INSTALLER/system/; }
cf () { cp -rv $INSTALLER/custom/CF/* $INSTALLER/system/; }
full () { hf; bf; cf; }
alt () { cp -rv $INSTALLER/custom/Alt/* $INSTALLER/system/; }

SEL=1
NOK=true

echo "
Which version will be installed?
Vol+ = Select; Vol- = Ok

1. Full
2. Full + Alternative
3. Headline
4. Headline/Body
5. Headline/Body + Alternative
"
echo 'Select:'
while $NOK; do
	echo "$SEL"
	if $VKSEL; then
		SEL=$((SEL + 1))
	else 
		NOK=false
	fi
	if [ $SEL -gt 5 ]; then
		SEL=1
	fi
done

echo -e "\nSelected:\n$SEL\n"
case $SEL in
	1 ) full;;
	2 ) full; alt;;
	3 ) hf;;
	4 ) hf; bf;;
	5 ) hf; bf; alt;;
esac

echo ""
