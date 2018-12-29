function _pure_prompt_host
    set --query --global hostname
    or set --local hostname (hostname --short) # current host name
    set --local hostname_color "$pure_host_color"

    echo "$hostname_color$hostname"
end