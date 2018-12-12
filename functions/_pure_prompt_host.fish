function _pure_prompt_host
    set -qg hostname
    or set --local hostname (hostname -s) # current host name
    set --local hostname_color "$pure_host_color"

    echo "$hostname_color$hostname"
end