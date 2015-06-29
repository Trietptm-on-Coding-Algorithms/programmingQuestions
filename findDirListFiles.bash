# In the scripting language of your choice, write a quick script to count the number of files in a directory called "baz"
#!/bin/bash
# Created by Charles M. Chong
a=$(expr 0)
dir=$(find -maxdepth 1 -type d -name 'baz' | awk 'NR==1')
for i in $( ls $dir )
do 
echo $a
a=$(expr $a + 1)
done
