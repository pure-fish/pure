source (status dirname)/../tools/versions-compare.fish
source (status dirname)/../tools/githooks.fish
@echo (_print_filename (status filename))

if fish_version_at_least 3.4.0 # --groups-only requires https://github.com/fish-shell/fish-shell/releases/tag/3.4.0
@test "_pure_tools_githooks_sanitize_branch: replaces slash with hyphen" (
    _pure_tools_githooks_sanitize_branch 'feature/foo'
) = 'feature-foo'

@test "_pure_tools_githooks_sanitize_branch: removes invalid characters" (
    _pure_tools_githooks_sanitize_branch 'feature/foo!@#$%^&*()_+=1'
) = 'feature-foo1'

@test "_pure_tools_githooks_get_new_version_line: updates version with branch suffix" (
    set line 'set --global pure_version 1.2.3 # comment'
    set branch 'feature/foo'
    _pure_tools_githooks_get_new_version_line "$line" "$branch"
) = 'set --global pure_version 1.2.3-feature-foo # comment'

@test "_pure_tools_githooks_get_new_version_line: preserves base version when updating" (
    set line 'set --global pure_version 1.2.3-old-branch'
    set branch 'new-branch'
    _pure_tools_githooks_get_new_version_line "$line" "$branch"
) = 'set --global pure_version 1.2.3-new-branch'

@test "_pure_tools_githooks_get_new_version_line: ignores non-version lines" (
    set line '# just a comment'
    set branch 'feature/foo'
    _pure_tools_githooks_get_new_version_line "$line" "$branch"
) = '# just a comment'

@test "pure_tools_githooks_update_version_file: updates version in actual file" (
    set temp_file (mktemp)
    echo 'set --global pure_version 2.5.1 # For bug report' > $temp_file
    echo '# Base colors' >> $temp_file
    
    pure_tools_githooks_update_version_file "$temp_file" 'feature/awesome'
    
    set result (grep 'pure_version' $temp_file)
    rm -f $temp_file
    
    echo "$result"
) = 'set --global pure_version 2.5.1-feature-awesome # For bug report'

@test "pure_tools_githooks_update_version_file: handles non-existent file gracefully" (
    pure_tools_githooks_update_version_file '/tmp/nonexistent-file-12345.fish' 'some-branch' 2>&1 | grep -q 'Error: File not found'
) $status -eq 0

@test "_pure_tools_githooks_get_new_version_line: works with master branch" (
    set line 'set --global pure_version 1.2.3 # comment'
    set branch 'master'
    _pure_tools_githooks_get_new_version_line "$line" "$branch"
) = 'set --global pure_version 1.2.3-master # comment'
end