#!/usr/bin/env fish

# "Generate changelog from GitHub releases"
function update_changelog() {
    changelog_file="docs/changelog.md"
    repo="pure-fish/pure"
    
    echo "Fetching releases from GitHub..."
    
    # Create changelog header with frontmatter
    printf -- "---\n" > "$changelog_file"
    printf "toc_depth: 3\n" >> "$changelog_file"
    printf -- "---\n\n" >> "$changelog_file"
    printf "# Changelog\n\n" >> "$changelog_file"
    printf "!!! note\n\n" >> "$changelog_file"
    printf "\tAll notable changes to this project are documented below.\n" >> "$changelog_file"
    printf "\tThis changelog is automatically generated from [GitHub Releases](%s).\n\n" \
        "https://github.com/$repo/releases" >> "$changelog_file"
    
    # Fetch all releases from GitHub API
    releases_json=$(curl -s "https://api.github.com/repos/$repo/releases")
    
    if test -z "$releases_json"; then
        echo "Error: Failed to fetch releases from GitHub API" >&2
        return 1
    fi
    
    # Parse and format each release
    echo "$releases_json" > /tmp/releases.json
    echo "$releases_json" | jq -r '.[] | 
        "## [\(.name)](\(.html_url))\n\n<small>\(.published_at[:10])</small>\n\n\(.body)\n\n---\n"' \
        >> "$changelog_file"
    
    echo "✓ Changelog updated successfully at $changelog_file"
}

update_changelog
