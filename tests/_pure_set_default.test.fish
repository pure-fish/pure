source $current_dirname/../functions/_pure_set_default.fish

set --local empty ''
set --local fail 1

function teardown
    set --universal --erase my_var
    set --global --erase my_var
end

@test "_pure_set_default: set my_var default value" (
    _pure_set_default my_var 'default_value'
    echo $my_var
) = 'default_value'

@test "_pure_set_default: skip setting value if default already exists at universal scope" (
    _pure_set_default my_var 'default_value'
    _pure_set_default my_var 'another_value'
    echo $my_var
) = 'default_value'

@test "_pure_set_default: overwrite UNIVERSAL empty value to make sure the user won't have empty colors." (
    _pure_set_default my_var $empty
    _pure_set_default my_var 'default_value'
    echo $my_var
) = 'default_value'

@test "_pure_set_default: skip setting value if default already exists at global scope" (
    set --global my_var 'default_value'
    _pure_set_default my_var 'another_value'
    echo $my_var
) = 'default_value'
