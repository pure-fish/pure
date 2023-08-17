source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/mocks/mocks.fish
source (dirname (status filename))/../functions/_pure_k8s_context.fish
@echo (_print_filename (status filename))


function before_each
    functions --erase head
    _cleanup_spy_calls
end


before_each
@test "_pure_k8s_context: return context" (
    _mock kubectl


    _pure_k8s_context
) = my-context

before_each
@test "_pure_k8s_context: call `kubectl config current-context`" (
    function kubectl; echo (status function) $argv > /tmp/called; end # spy

    _pure_k8s_context
    _has_called "kubectl config current-context"
) $status -eq $SUCCESS
