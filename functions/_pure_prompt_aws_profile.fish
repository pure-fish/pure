function _pure_prompt_aws_profile --description "Display AWS profile name"
    if test -n "$AWS_VAULT"
        set --local aws_profile "$AWS_VAULT"
        set --local aws_profile_color (_pure_set_color $pure_color_aws_profile)

        echo "$aws_profile_color$aws_profile"
    else if test -n "$AWS_PROFILE" -o "$AWS_PROFILE" != default
        set --local aws_profile "$AWS_PROFILE"
        set --local aws_profile_color (_pure_set_color $pure_color_aws_profile)

        echo "$aws_profile_color$aws_profile"
    end
end
