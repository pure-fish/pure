function _pure_prompt_jobs --description "Display number of running jobs"
    if test $pure_show_jobs = true
        set --local njobs (count (jobs -p))
        set --local jobs_color (_pure_get_var pure_color_jobs $pure_color_normal)
        if test $njobs -gt 0
            echo "$jobs_color"[$njobs]
        end
    end
end
