function _pure_prompt_ssh_host
    set --query --global hostname
    or set --local hostname (hostname -s) # current host name compatible busybox
    set --local hostname_color "$pure_color_ssh_host"

    echo "$hostname_color$hostname"
end
