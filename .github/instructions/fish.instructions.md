---
description: 'Shell scripting best practices and conventions for fish shell'
applyTo: '**/*.fish'
---

# Shell Scripting Guidelines

Instructions for writing clean, safe, and maintainable shell scripts for Fish shell

## General Principles

- Generate code that is clean, simple, and concise
- Ensure scripts are easily readable and understandable
- Add comments where helpful for understanding how the script works
- Generate concise and simple echo outputs to provide execution status
- Avoid unnecessary echo output and excessive logging
- Use shellcheck for static analysis when available
- Prefer safe expansions: double-quote variable references (`"$var"`), use `${var}` for clarity, and avoid `eval`
- Choose reliable parsers for structured data instead of ad-hoc text processing
- Use long-form options for commands to improve readability
- use named variables instead of positional parameters where possible

## Error Handling & Safety

- Always enable `set -euo pipefail` to fail fast on errors, catch unset variables, and surface pipeline failures
- Validate all required parameters before execution
- Provide clear error messages with context
- Use `trap` to clean up temporary resources or handle unexpected exits when the script terminates
- Use `mktemp` to create temporary files or directories safely and ensure they are removed in your cleanup handler

## Script Structure

- Each script should be encapsulated in a function in a dedicated file to leverage autoloading mechanism of Fish shell
- Do no start with a clear shebang: `/bin/fish` unless specified otherwise
- Include a `--description` option to function definition explaining the script's purpose
- Define default values for all variables at the top
- Use functions for reusable code blocks
- Create reusable functions instead of repeating similar blocks of code
- Keep the main execution flow clean and readable

## Working with JSON and YAML

- Prefer dedicated parsers (`jq` for JSON, `yq` for YAML—or `jq` on JSON converted via `yq`) over ad-hoc text processing with `grep`, `awk`, or shell string splitting
- When `jq`/`yq` are unavailable or not appropriate, choose the next most reliable parser available in your environment, and be explicit about how it should be used safely
- Validate that required fields exist and handle missing/invalid data paths explicitly (e.g., by checking `jq` exit status or using `// empty`)
- Quote jq/yq filters to prevent shell expansion and prefer `--raw-output` when you need plain strings
- Treat parser errors as fatal: combine with `set -euo pipefail` or test command success before using results
- Document parser dependencies at the top of the script and fail fast with a helpful message if `jq`/`yq` (or alternative tools) are required but not installed

```fish
# Example function following the guidelines above
function example_git_status --description 'Display a formatted git status summary'
    # Validate we're in a git repository
    if not git rev-parse --git-dir >/dev/null 2>&1
        echo "Error: Not a git repository" >&2
        return 1
    end

    # Get current branch name
    set --local branch_name (git branch --show-current 2>/dev/null)
    if test -z "$branch_name"
        set branch_name "detached HEAD"
    end

    # Count modified and staged files
    set --local modified_count (git diff --name-only | count)
    set --local staged_count (git diff --cached --name-only | count)

    # Display summary
    echo "Branch: $branch_name"
    echo "Modified: $modified_count"
    echo "Staged: $staged_count"
end
```
