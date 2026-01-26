function _pure_tools_githooks_sanitize_branch
    set --local branch "$argv[1]"
    # Replace slashes with hyphens and remove invalid characters for SemVer
    echo "$branch" | string replace --all '/' '-' | string replace --regex --all '[^a-zA-Z0-9-]' ''
end

function _pure_tools_githooks_get_new_version_line
    set --local line "$argv[1]"
    set --local branch "$argv[2]"

    if string match --regex --quiet '^set --global pure_version' "$line"
        set --local base_version (string match --regex --groups-only 'pure_version (\d+\.\d+\.\d+)' "$line")
        
        if test -n "$base_version"
            set --local sane_branch (_pure_tools_githooks_sanitize_branch "$branch")
            string replace --regex 'pure_version \d+\.\d+\.\d+(?:-[^\s]+)?' "pure_version $base_version-$sane_branch" "$line"
            return 0
        end
    end
    echo "$line"
end


function pure_tools_githooks_update_version_file
    set --local file_path "$argv[1]"
    set --local branch_name "$argv[2]"

    if not test -f "$file_path"
        echo "Error: File not found: $file_path" >&2
        return 1
    end

    set --local temp_file (mktemp)
    set --local modified 0

    while read --line line
        set --local new_line (_pure_tools_githooks_get_new_version_line "$line" "$branch_name")
        echo $new_line >> $temp_file
    end < "$file_path"
    
    mv "$temp_file" "$file_path"
end
