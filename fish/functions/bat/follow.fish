function follow
    tail -f $argv[1] | bat --paging=never -l log
end