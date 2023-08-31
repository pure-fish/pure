source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_k8s_context.fish
@echo (_print_filename (status filename))


function before_each
    functions --erase head
    _clean_all_spy_calls
end

before_each
@test "_pure_k8s_context: return context" (
    _mock kubectl

    _pure_k8s_context
) = my-context

before_each
@test "_pure_k8s_context: call `kubectl config current-context`" (
    function kubectl; echo (status current-function) $argv > /tmp/(status current-function).mock_calls; end # spy

    _pure_k8s_context
    _has_called kubectl "config current-context"
) $status -eq $SUCCESS
