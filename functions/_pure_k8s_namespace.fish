function _pure_k8s_namespace
    kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null
end
