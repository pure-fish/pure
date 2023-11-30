function _pure_k8s_namespace
    set namespace (kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)

    if test -z "$namespace"
        set namespace default
    end

    echo $namespace
end
