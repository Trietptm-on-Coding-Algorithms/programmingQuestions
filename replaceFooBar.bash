# What Linux command would you use to replace all instances of the string "/etc/foo" with the string "/etc/bar" in a file called "config.conf"?

# using sed
sed -i -- 's/foo/bar/g' config.conf

# using printf + vim
printf ":%s/foo/bar/g\n[^:x\n" >> replace.cmds ; vim -s replace.cmds config.conf
