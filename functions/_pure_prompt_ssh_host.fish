function _pure_prompt_ssh_host
    set --query --global hostname
    or set --local hostname (hostname -s) # current host name compatible busybox
    set --local hostname_color (_pure_get_var pure_color_ssh_hostname $pure_color_mute)

    echo "$hostname_color$hostname"
end
