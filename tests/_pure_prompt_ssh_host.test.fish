source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_prompt_ssh_host.fish
source $current_dirname/../functions/_pure_set_color.fish
source $current_dirname/../tools/versions-compare.fish
@mesg (_print_filename $current_filename)


if fish_version_at_least '3.0.0'
    @mesg (print_fish_version_at_least '3.0.0')
    @test "_pure_prompt_ssh_host: use native \$hostname" (
        set --global pure_color_ssh_hostname grey

        _pure_prompt_ssh_host > /dev/null
    ) $status -eq $SUCCESS
end
