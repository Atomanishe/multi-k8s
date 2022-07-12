#!/bin/bash
echo "Input mobile mobile model please"
read brand
case $brand in
	samsung)
		echo "You have a great discont on your $brand - 40%";;
	nokia)
		echo "Discount on your $brand is not so impressive - 50%";;
	huawei)
		echo "Discount on this $brand is tremendous -70%";;
	*)
		echo "Dont fuck up my mind"
esac
