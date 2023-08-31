source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_k8s_namespace.fish
@echo (_print_filename (status filename))


function before_each
    functions --erase head
    _clean_all_spy_calls
end


before_each
@test "_pure_k8s_namespace: return context" (
    _mock kubectl

    _pure_k8s_namespace
) = my-namespace

before_each
@test "_pure_k8s_namespace: call `kubectl config view…`" (
    function kubectl; echo (status current-function) $argv > /tmp/(status current-function).mock_calls; end # spy

    _pure_k8s_namespace
    _has_called kubectl "config view --minify --output jsonpath={..namespace}"
) $status -eq $SUCCESS
