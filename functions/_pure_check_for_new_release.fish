function _pure_check_for_new_release \
    --description "Check for new release and show command to install"

    if test $pure_check_for_new_release = true
        echo "🛈 Checking for new release…"
        set latest (curl --silent "https://api.github.com/repos/rafaelrinaldi/pure/releases/latest" | sed -n 's/.*tag_name":\s"v\(.*\)".*/\1/p')

        if test $pure_version != $latest
            set --local latest_version (_pure_set_color $pure_color_info)$latest(_pure_set_color pure_color_normal)
            echo -e "🔔 New version available!\n"
            echo -e (_pure_set_color $pure_color_success)"fisher install rafaelrinaldi/pure@$latest_version\n"
        end
    end
end
