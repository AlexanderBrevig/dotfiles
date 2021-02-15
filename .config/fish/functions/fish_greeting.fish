function fish_greeting
    set hour (date +"%H")

    if test $hour -ge 7
        and test $hour -lt 18
        task context work
    end
    if test $hour -ge 11
        and test $hour -lt 12
        task context study
    end
    if test $hour -ge 12
        and test $hour -lt 18
        task context work
    end
    if test $hour -ge 18
        and test $hour -lt 21
        task context home
    end
    if test $hour -ge 21
        or test $hour -lt 7
        task context play
    end
    clear
    task next
end
