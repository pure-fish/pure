source $DIRNAME/../functions/_pure_prompt_beginning.fish

test "print prompt with newline for existing session"
    (
        set _pure_fresh_session 0

        _pure_prompt_beginning
    ) = '\n\r\033[K'
end

test "print prompt without newline for new session"
    (
        set _pure_fresh_session 1

        _pure_prompt_beginning
    ) = '\r\033[K'
end