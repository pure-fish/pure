source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/mocks/mocks.fish
source (dirname (status filename))/../functions/_pure_k8s_namespace.fish
@echo (_print_filename (status filename))


function before_each
    functions --erase head
    _cleanup_spy_calls
end


before_each
@test "_pure_k8s_namespace: return context" (
    _mock kubectl

    _pure_k8s_namespace
) = my-namespace

before_each
@test "_pure_k8s_namespace: call `kubectl config view…`" (
    function kubectl; echo (status function) $argv > /tmp/called; end # spy

    _pure_k8s_namespace
    _has_called "kubectl config view --minify --output jsonpath={..namespace}"
) $status -eq $SUCCESS
