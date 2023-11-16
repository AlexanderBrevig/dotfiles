function jnl
    printf "%s\t%s\n" $(date '+%Y-%m-%d %H:%M:%S') "$argv" >> ~/journal.txt
end