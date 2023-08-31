source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_is_inside_container.fish
source (status dirname)/../functions/_pure_user_at_host.fish
source (status dirname)/../functions/_pure_prompt_container.fish
source (status dirname)/../functions/_pure_detect_container_by_pid_method.fish
source (status dirname)/../functions/_pure_detect_container_by_cgroup_method.fish
@echo (_print_filename (status filename))


function before_each
    _purge_configs
    _disable_colors
end

function after_each
    _clean_all_mocks
end

if test "$USER" = nemo # we need to be in a container for those to work
    before_each
    @test "_pure_prompt_container: displays 'user@hostname' when inside container" (
        set --universal pure_enable_container_detection true
        string match --quiet --regex "$USER@[\w]+" (_pure_prompt_container)
    ) $status -eq $SUCCESS

    before_each
    @test "_pure_prompt_container: displays container prefix when inside container" (
        set --universal pure_enable_container_detection true
        set --universal pure_symbol_container_prefix "🐋"

        string match --quiet --regex "🐋" (_pure_prompt_container)
    ) $status -eq $SUCCESS
end

@test "_pure_prompt_container: print nothing when outside a container" (
    set --universal pure_enable_container_detection true
    _mock_exit_status _pure_is_inside_container $FAILURE

    echo (_pure_prompt_container)
) = $EMPTY
after_each

@test "_pure_prompt_container: check is inside a container" (
    set --universal pure_enable_container_detection true
    _mock_exit_status _pure_is_inside_container $FAILURE

    _pure_prompt_container
    _has_called _pure_is_inside_container
) $status -eq $SUCCESS
after_each
