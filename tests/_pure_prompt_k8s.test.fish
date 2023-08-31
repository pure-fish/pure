source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_prompt_k8s.fish
source (status dirname)/../functions/_pure_k8s_context.fish
source (status dirname)/../functions/_pure_k8s_namespace.fish
source (status dirname)/../functions/_pure_check_availability.fish
@echo (_print_filename (status filename))

function before_each
    _purge_configs
    _disable_colors
end

function after_all
    _clean_all_mocks
end


@test "_pure_prompt_k8s: ensure default behaviour has no error" (
    _pure_prompt_k8s
) $status -eq $SUCCESS


@test "_pure_prompt_k8s: ensure default behaviour print nothing" (
    echo (_pure_prompt_k8s)
) = $EMPTY


before_each
@test "_pure_prompt_k8s: print kubernetes context and namespace" (
    set --universal pure_enable_k8s true
    set --universal pure_symbol_k8s_prefix "☸"
    _mock kubectl

    _pure_prompt_k8s
) = '☸ my-context/my-namespace'

after_all
