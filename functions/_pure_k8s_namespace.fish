function _pure_k8s_namespace
    kubectl config view --minify --output 'jsonpath={..namespace}'
end
