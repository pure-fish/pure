source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_check_availability.fish
@echo (_print_filename (status filename))


@test "_pure_check_availability: output help message when command is missing" (
    set required_command foo-(random)
    set feature_flag foo
    
    set output (_pure_check_availability $feature_flag $required_command)

    string match --quiet --regex "$feature_flag feature requires:" $output
) $status -eq $SUCCESS

@test "_pure_check_availability: exit with failure when command is missing" (
    set required_command foo-(random)
    set feature_flag foo
    
    _pure_check_availability $feature_flag $required_command &> /dev/null
) $status -eq $FAILURE

@test "_pure_check_availability: exit with success when command is available" (
    set required_command ls
    set feature_flag foo

    _pure_check_availability $feature_flag $required_command
) $status -eq $SUCCESS
