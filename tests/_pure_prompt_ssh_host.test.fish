source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_ssh_host.fish
source $current_dirname/../tools/versions-compare.fish
@mesg (_print_filename $current_filename)


function setup
    _purge_configs
    _disable_colors
end


@test "_pure_prompt_ssh_host: use native \$hostname" (
    set --universal pure_color_ssh_hostname grey

    _pure_prompt_ssh_host > /dev/null
) $status -eq $SUCCESS
