function kubectl \
    --description 'kubectl mock for test' \
    --argument-names \
    topcommand \
    subcommand

    if test $topcommand = config
        if test $subcommand = current-context
            echo my-context
        end
        if test $subcommand = view
            echo my-namespace
        end
    else
        echo "unknown command"
    end
end # mock
