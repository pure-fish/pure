source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_prompt_ssh.fish
source (status dirname)/../functions/_pure_user_at_host.fish
@echo (_print_filename (status filename))


function before_each
    _purge_configs
    _disable_colors
end
before_each


@test "_pure_prompt_ssh: hide 'user@hostname' when working locally" (
    set --erase SSH_CONNECTION

    _pure_prompt_ssh
) $status -eq $SUCCESS

@test "_pure_prompt_ssh: displays 'user@hostname' when on SSH connection (based on \$hostname variable)" (
    set SSH_CONNECTION 127.0.0.1 56422 127.0.0.1 22
    function id; echo 'user'; end  # mock

    string match --quiet --regex 'user@[\w]+' (_pure_prompt_ssh)
    # $hostname is read-only, we cant determine it preceisely (e.g. is dynamic in docker container)
) $status -eq $SUCCESS

@test "_pure_prompt_ssh: displays ssh prefix when SSH connection detected" (
    set SSH_CONNECTION 127.0.0.1 56422 127.0.0.1 22
    function id; echo 'user'; end  # mock
    set --universal pure_symbol_ssh_prefix "ssh:/"

    string match --quiet --regex 'ssh:/' (_pure_prompt_ssh)
) $status -eq $SUCCESS
