function _pure_prompt_aws \
    --description 'Print prompt symbol' \
    --argument-names exit_code

    set --local virtualenv (_pure_prompt_virtualenv) # Python virtualenv name
    set --local awsenv (_okta_aws_prompt) # Okta AWS Profile name
    set --local vimode_indicator (_pure_prompt_vimode) # vi-mode indicator
    set --local pure_symbol (_pure_prompt_symbol $exit_code)

    echo (_pure_print_prompt $virtualenv $awsenv $vimode_indicator $pure_symbol)
end
