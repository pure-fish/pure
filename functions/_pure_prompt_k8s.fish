function _pure_prompt_k8s
    if set --query pure_enable_k8s;
        and test "$pure_enable_k8s" = true;
        and _pure_check_availability pure_enable_k8s kubectl
        and test -n (_pure_k8s_context) # todo: use $(cmd) syntax when Fish 3.3.1 is dropped

        set --local context (_pure_set_color $pure_color_k8s_context)(_pure_k8s_context)

        if test -n "$context"
            set --local symbol (_pure_set_color $pure_color_k8s_prefix)$pure_symbol_k8s_prefix
            set --local namespace (_pure_set_color $pure_color_k8s_namespace)(_pure_k8s_namespace)

            echo "$symbol $context/$namespace"
        end
    end
end
