source (status dirname)/fixtures/constants.fish
source (status dirname)/../functions/_pure_set_default.fish
source (status dirname)/../functions/_pure_prompt_aws_profile.fish
@echo (_print_filename (status filename))

function before_each
    _purge_configs
    _disable_colors # we use mocks so cleaning them must happen before

    set --erase AWS_PROFILE
    set --erase AWS_VAULT
end

before_each
@test "_pure_prompt_aws_profile: ensure default behaviour has no error" (
    source (status dirname)/../conf.d/pure.fish

    _pure_prompt_aws_profile
) $status -eq $SUCCESS


before_each
@test "_pure_prompt_aws_profile: ensure default behaviour print nothing when no AWS variables" (
    source (status dirname)/../conf.d/pure.fish

    echo (_pure_prompt_aws_profile)
) = $EMPTY

before_each
@test "_pure_prompt_aws_profile: print AWS_VAULT when present" (
    set --universal pure_enable_aws_profile true
    set --universal pure_symbol_aws_profile_prefix "🅰"
    set --global AWS_VAULT my-vault

    _pure_prompt_aws_profile
) = '🅰my-vault'

before_each
@test "_pure_prompt_aws_profile: print AWS_PROFILE when present" (
    set --universal pure_enable_aws_profile true
    set --universal pure_symbol_aws_profile_prefix "🅰"
    set --global AWS_PROFILE my-profile

    _pure_prompt_aws_profile
) = '🅰my-profile'


before_each
@test "_pure_prompt_aws_profile: print only AWS_VAULT when vault and profile are present" (
    set --universal pure_enable_aws_profile true
    set --universal pure_symbol_aws_profile_prefix "🅰"
    set --global AWS_VAULT my-vault
    set --global AWS_PROFILE my-profile

    _pure_prompt_aws_profile
) = '🅰my-vault'
