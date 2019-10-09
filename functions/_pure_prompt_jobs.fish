function _pure_prompt_jobs --description "Display number of running jobs"
    if test $pure_show_jobs = true
        set --local njobs (count (jobs -p))
        if test $njobs -gt 0
            echo "$pure_color_jobs"[$njobs]
        end
    end
end
