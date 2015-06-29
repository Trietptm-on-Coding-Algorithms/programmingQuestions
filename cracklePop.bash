# Write a program that prints out the numbers 1 to 100 (inclusive). 
# If the number is divisible by 3, print Crackle instead of the number. 
# If it's divisible by 5, print Pop. If it's divisible by both 3 and 5, print CracklePop. 
# You can use any language.

rice=$(expr 1)
crispies=$(expr 100)
until [$rice -gt $crispies ]; do
if (( $rice % 3 != 0 )) && (( $rice % 5 != 0 ))
then
echo $rice
if (( $rice % 3 == 0 ))
then
if (( $rice % 5 == 0 ))
then
echo "CracklePop"
else
echo "Crackle"
fi
fi
if (( $rice % 5 == 0 ))
then
rice=$(expr $rice + 1)
exho "Pop"
else
rice=$(expr $rice + 1)
fi
done
