source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_user_at_host.fish
@echo (_print_filename (status filename))


function before_all
    _purge_configs
    _disable_colors
end
before_all


@test "_pure_user_at_host: standard user" (
    string match --quiet --regex (id -u -n)'@[\w]+' (_pure_user_at_host)
) $status -eq $SUCCESS

@test "_pure_user_at_host: root user" (
    function id; echo 'root'; end # mock

    string match --quiet --regex 'root@[\w]+' (_pure_user_at_host)
) $status -eq $SUCCESS

@test "_pure_user_at_host: colorize for normal user" (
    _pure_unmock _pure_set_color # enable colors
    set --universal pure_color_username_normal green
    set --universal pure_color_at_sign grey
    set --universal pure_color_hostname blue

    string match --quiet --regex (set_color green)(id -u -n)(set_color grey)'@'(set_color blue)'[\w]+' (_pure_user_at_host)
) $status -eq $SUCCESS

@test "_pure_user_at_host: colorize for root user" (
    _pure_unmock _pure_set_color # enable colors
    function id; echo 'root'; end # mock
    set --universal pure_color_username_root red
    set --universal pure_color_at_sign grey
    set --universal pure_color_hostname blue

    string match --quiet --regex '^'(set_color green)'root'(set_color grey)'@'(set_color blue)'[\w]+' (_pure_user_at_host)'$'
) $status -eq $SUCCESS
