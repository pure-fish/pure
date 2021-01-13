function _pure_prompt_jobs --description "Display number of running jobs"
    if set --query pure_show_jobs; and test "$pure_show_jobs" = true
        set --local njobs (count (jobs -p))
        set --local jobs_color (_pure_set_color $pure_color_jobs)
        if test "$njobs" -gt 0
            echo "$jobs_color"[$njobs]
        end
    end
end
