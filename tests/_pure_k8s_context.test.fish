source (dirname (status filename))/fixtures/constants.fish
source (dirname (status filename))/../functions/_pure_k8s_context.fish
@echo (_print_filename (status filename))


function before_each
    functions --erase head
    _cleanup_calls
end


before_each
@test "__pure_k8s_context: return context" (
    function kubectl
        echo foo-bar-cluster-eu-west-3
    end # mock

    _pure_k8s_context
) = foo-bar-cluster-eu-west-3

before_each
@test "__pure_k8s_context: call `kubectl config current-context`" (
    function kubectl; echo (status function) $argv > /tmp/called; end # spy

    _pure_k8s_context
    _has_called "kubectl config current-context"
) $status -eq $SUCCESS
