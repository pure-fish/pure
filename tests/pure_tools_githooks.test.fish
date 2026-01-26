source (status dirname)/../tools/githooks.fish

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
end