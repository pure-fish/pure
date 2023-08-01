function _pure_k8s_namespace
    echo (kubectl config view --minify --output 'jsonpath={..namespace}')
end
