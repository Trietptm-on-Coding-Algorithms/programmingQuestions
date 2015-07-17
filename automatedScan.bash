#!/bin/bash
# site1.com clean clean
# site2.com blacklisted clean
# site3.com blacklisted malwarefound
# site4.com clean malwarefound
# site5.com clean malwarefound
# site6.com clean clean
# site7.com clean clean
# site8.com clean clean
# site9.com clean malwarefound
# site9.com clean clean
# sitea.com blacklisted malwarefound
# What command would you run to generate a quick report on how many of those are blacklisted, how many are clean clean (no issues found) and how many had malware detected? You can send the results for those 10 sites so we can see them. Note that this has to be automated, since those 50k entries get modified many times a day.
# While loop.  While reading Lines from inputed file, Do...
while read line ;do
# Print out current read line
echo "The current Line is: "$line
# Declaring Variables. Used Regex to parse a substring as it's own variable
aVar=$(echo $line | grep -oP "^([^\ ]*\ ){0}\K[^\ ]*")
bVar=$(echo $line | grep -oP "^([^\ ]*\ ){1}\K[^\ ]*")
cVar=$(echo $line | grep -oP "^([^\ ]*\ ){2}\K[^\ ]*")
# if loop; the counter plays little relevance. Would probably use a boolean for this
if (( counter == 0))
then
        # if B and C are "clean", then increment the amount of cleanSites by 1
        if [ $bVar = "clean" ] && [ $cVar = "clean" ]
        then
                echo $aVar" is a clean site!"
                cleanSites=$(expr $cleanSites + 1)
        fi
        # if B or C are "blacklisted" or "malwarefound" then increment the amount of attSites by 1
        if [ $bVar = "blacklisted" ] || [ $cVar = "malwarefound" ]
        then
                echo $aVar" needs attention!"
                attSites=$(expr $attSites + 1)
        fi
        # if B is "blacklisted" then increment the amount of blackSites by 1
        if [ $bVar = "blacklisted" ]
        then
                echo $aVar" is blacklisted!"
                blackSites=$(expr $blackSites + 1)
        fi
        # if C is "malwarefound" then increment the amount of malwareSites by 1
        if [ $cVar = "malwarefound" ]
        then
                echo $aVar" has malware found!"
                malwareSites=$(expr $malwareSites + 1)
        fi
fi
# Endingn While loop, feeding input for it to read 'sitelistscan.txt'
done < sitelistscan.txt 
echo "Number of Clean Sites: "$cleanSites
echo "Number of Blacklisted Sites: "$blackSites
echo "Number of Malware Found Sites: "$malwareSites
echo "Number of Sites that need Attention: "$attSites
