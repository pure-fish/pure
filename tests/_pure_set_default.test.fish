source $current_dirname/fixtures/constants.fish
source $current_dirname/../functions/_pure_set_default.fish
@mesg (_print_filename $current_filename)


function setup
    _purge_configs
    _disable_colors
end

function teardown
    set --erase --universal my_var
    set --erase --global my_var
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
    _pure_set_default my_var $EMPTY
    _pure_set_default my_var 'default_value'
    echo $my_var
) = 'default_value'

@test "_pure_set_default: skip setting value if default already exists at global scope" (
    set --global my_var 'default_value'
    _pure_set_default my_var 'another_value'
    echo $my_var
) = 'default_value'
