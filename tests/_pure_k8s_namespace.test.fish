source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_k8s_namespace.fish
@echo (_print_filename (status filename))


function before_each
    _clean_all_spy_calls
    _clean_all_mocks
end


before_each
@test "_pure_k8s_namespace: return 'my-namespace'" (
    _mock kubectl

    _pure_k8s_namespace
) = 'my-namespace'

before_each
@test "_pure_k8s_namespace: call `kubectl config view…`" (
    _spy kubectl

    _pure_k8s_namespace > /dev/null

    _has_called kubectl "config view --minify --output jsonpath={..namespace}"
) $status -eq $SUCCESS

before_each
@test "_pure_k8s_namespace: return 'default' when no namespace is set" (
    _mock_response kubectl ""

    _pure_k8s_namespace
) = 'default'
