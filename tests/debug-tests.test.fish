set test_files \
    # _pure \
    # _pure \
    # _pure_check_for_new_release \
    # _pure_format_time \
    # _pure_get_prompt_symbol \
    # # _pure_init \
    # _pure_is_single_line_prompt \
    # _pure_parse_directory \
    # _pure_parse_git_branch \
    # _pure_place_iterm2_prompt_mark \
    # _pure_prefix_root_prompt \
    # _pure_print_prompt \
    # _pure_print_prompt_rows \
    # _pure_prompt \
    # _pure_prompt_beginning \
    # _pure_prompt_command_duration \
    # _pure_prompt_current_folder \
    # _pure_prompt_ending \
    # _pure_prompt_first_line \
    # _pure_prompt_git \
    # _pure_prompt_git_branch \
    # _pure_prompt_git_dirty \
    # _pure_prompt_git_pending_commits \
    # _pure_prompt_git_stash \
    # _pure_prompt_jobs \
    # _pure_prompt_new_line \
    # _pure_prompt_ssh \
    # _pure_prompt_symbol \
    # _pure_prompt_system_time \
    # _pure_prompt_vimode \
    # _pure_prompt_virtualenv \
    # _pure_set_color \
    # _pure_set_default \
    # _pure_string_width \
    # _pure_uninstall \
    # _pure_user_at_host \
    # # pure_tools_installer \
    # fish_greeting \
    # fish_mode_prompt \
    # fish_prompt \
    # fish_title \
    # pure_tools_versions-compare
    ''

set files_to_test _pure _pure_check_for_new_release

echo '' > debug.txt
for file in $test_files
    set glob (string join ',' $files_to_test)
    echo "v v v v v v $files_to_test[1]: $glob" | tee -a debug.txt

    make \
        build-pure-on \
        test-pure-on \
        FISH_VERSION=3.1.2 \
        CMD="fishtape tests/{$glob}.test.fish" \
    | grep --invert-match '^ok' | grep --invert-match 'only fish' \
    >> debug.txt
    set make_status $status

    echo "^ ^ ^ ^ ^ ^" $files_to_test[1] | tee -a debug.txt
    test "$make_status" -eq 0; or break

    set --append files_to_test $test_files[1]
    set --erase test_files[1]
end
