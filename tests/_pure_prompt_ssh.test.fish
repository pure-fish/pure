source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_ssh.fish
source $current_dirname/../functions/_pure_prompt_ssh_user.fish
source $current_dirname/../functions/_pure_prompt_ssh_separator.fish
source $current_dirname/../functions/_pure_prompt_ssh_host.fish
source $current_dirname/../tools/versions-compare.fish
@mesg (_print_filename $current_filename)


function setup
    _purge_configs
    _disable_colors
end


@test "_pure_prompt_ssh: hide 'user@hostname' when working locally" (
    set --erase SSH_CONNECTION

    _pure_prompt_ssh
) $status -eq $SUCCESS

@test "_pure_prompt_ssh: displays 'user@hostname' when on SSH connection (based on \$hostname variable)" (
    set SSH_CONNECTION 127.0.0.1 56422 127.0.0.1 22
    function id; echo 'user'; end  # mock

    set prompt_ssh_host (_pure_prompt_ssh)
    string match --quiet --regex 'user@[\w]+' $prompt_ssh_host
    # $hostname is read-only, we cant determine it preceisely (e.g. is dynamic in docker container)
) $status -eq $SUCCESS
