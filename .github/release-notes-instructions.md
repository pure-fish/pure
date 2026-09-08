# Release Notes Instructions

Write release notes in English and follow the structure below. Keep the notes concise, user-focused, and based only on the changes included in the release. Do not invent features, screenshots, contributors, dates, or links.

## Template

```markdown
## [vX.Y.Z: Short release summary](RELEASE_URL)

### [Main feature or fix](DOCUMENTATION_URL)

Explain what changed, why it matters to users, and any behavior that changed. Link to relevant documentation when useful.

#### Configuration

| Option | Default | Description |
| :----- | :------ | :---------- |
| **`option_name`** | `value` | Explain what the option controls. |

#### Usage

```fish
set --universal option_name value
```

#### Preview

<!-- Include only if a meaningful, accessible screenshot or recording exists. -->
![Description](IMAGE_URL)

### Another feature or fix

Describe the next user-visible change using the same pattern.

### What's Changed

* `type`: Short description by @author in [#123](PR_URL)

### New Contributors

* @author made their first contribution in [#123](PR_URL)

### Thanks

* Thank people who reported issues, provided feedback, or helped investigate them.

**Full Changelog**: [vPREVIOUS...vX.Y.Z](COMPARE_URL)

---

```

## Authoring Rules

- Put the newest release first.
- Use the exact released version, release date, release URL, pull request URLs, and comparison URL.
- Use a short, descriptive title. Add an emoji only when it clarifies the theme and matches existing releases.
- Lead with user-visible features and fixes. Put CI, documentation, maintenance, and contributor details in `What's Changed` when they are relevant to users or maintainers.
- Give each significant feature or fix its own `###` section. Explain defaults, compatibility requirements, and migration steps when applicable.
- Add configuration tables and Fish commands only for changes that introduce or alter user-facing options.
- Add previews only when the asset demonstrates the change. Use descriptive alt text and avoid redundant images. Fetch the images from the official documentation (https://pure-fish.github.io/pure/doc/). Avoid screenshots of the changelog itself. 
- Omit empty sections, including `Configuration`, `Usage`, `Preview`, `New Contributors`, and `Thanks`.
- Preserve project terminology and option names exactly, including backticks around commands, variables, and options.
- Keep Markdown valid and consistent with the existing changelog: release sections use `##`, feature sections use `###`, and releases are separated by `---`.
