source (status dirname)/fixtures/constants.fish
source (status dirname)/mocks/spectra.fish
source (status dirname)/../functions/_pure_is_single_line_prompt.fish
source (status dirname)/../functions/_pure_prompt_beginning.fish
source (status dirname)/../functions/_pure_prompt_new_line.fish
@echo (_print_filename (status filename))


function before_all
    _purge_configs
    _disable_colors
end
before_all

function before_each
    source (status dirname)/../functions/_pure_prompt_beginning.fish # restore function
    _clean_all_spy_calls
end


@test "_pure_prompt_new_line: print prompt with newline for existing session" (
    set --universal pure_enable_single_line_prompt false
    set _pure_fresh_session false

    _pure_prompt_new_line | wc -l
) -eq $IS_PRESENT

@test "_pure_prompt_new_line: print prompt without newline for new session" (
    set --universal pure_enable_single_line_prompt false
    set _pure_fresh_session true

    _pure_prompt_new_line | wc -l
) = $NONE

@test "_pure_prompt_new_line: print prompt without newline when single line prompt is enabled" (
    set _pure_fresh_session false
    set --universal pure_enable_single_line_prompt true

    _pure_prompt_new_line | wc -l
) = $NONE

before_each
@test "_pure_prompt_new_line: print prompt with newline for existing session" (
    set _pure_fresh_session false
    functions --erase _pure_prompt_beginning
    _spy _pure_prompt_beginning

    _pure_prompt_new_line

    _has_called _pure_prompt_beginning
) $status -eq $SUCCESS


before_each
@test "_pure_prompt_new_line: clean prompt and print prompt with newline for existing session" (
    set _pure_fresh_session false
    set --universal pure_enable_single_line_prompt false

    _pure_prompt_new_line | string collect --no-trim-newlines
) = \r\e'[K'\n


before_each
@test "_pure_prompt_new_line: clean prompt and print prompt with newline for existing session" (
    set _pure_fresh_session false
    set --universal pure_enable_single_line_prompt true

    _pure_prompt_new_line | string collect --no-trim-newlines
) = \r\e"[K"
