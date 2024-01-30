function _pure_prompt_aws_profile --description "Display AWS profile name"

    if set --query pure_enable_aws_profile;
        and test "$pure_enable_aws_profile" = true

        set --local aws_profile ''
        set --local aws_profile_color (_pure_set_color $pure_color_aws_profile)

        if test -n "$AWS_VAULT"
            set aws_profile "$AWS_VAULT"
        else if test -n "$AWS_PROFILE" -o "$AWS_PROFILE" != default
            set aws_profile "$AWS_PROFILE"
        end

        if test -n $aws_profile
            echo "$pure_symbol_aws_profile_prefix$aws_profile_color$aws_profile"
        end
    end
end
