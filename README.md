# asdf-apm

[![CI](https://github.com/edwinhern/asdf-apm/actions/workflows/workflow.yml/badge.svg)](https://github.com/edwinhern/asdf-apm/actions/workflows/workflow.yml)

[Agent Package Manager (APM)](https://github.com/microsoft/apm) plugin for [asdf](https://asdf-vm.com).

APM is an open-source dependency manager for AI agents by Microsoft. It provides manifest-based configuration via `apm.yml`, similar to `package.json` for npm, with transitive dependency resolution and content security scanning.

---

## Requirements

- Make sure you have the required dependencies installed:
  - `curl`
  - `tar`
  - `sha256sum` or `shasum`

---

## Installation

### Add the plugin

```bash
asdf plugin add apm https://github.com/edwinhern/asdf-apm
```

### Install a version

```bash
# Install the latest stable version
asdf install apm latest

# Install a specific version
asdf install apm 0.8.10
```

### Set the version

```bash
# Set globally
asdf global apm latest

# Set locally (writes to .tool-versions in current directory)
asdf local apm 0.8.10
```

### Verify

```bash
apm --version
```

---

## Usage with `.tool-versions`

Add a `.tool-versions` file to your project:

```
apm 0.8.10
```

Then run:

```bash
asdf install
```

---

## Available Versions

```bash
asdf list-all apm
```

---

## Supported Platforms

| OS      | Architecture          | Supported              |
| ------- | --------------------- | ---------------------- |
| macOS   | arm64 (Apple Silicon) | Yes                    |
| macOS   | x86_64 (Intel)        | Yes                    |
| Linux   | x86_64                | Yes                    |
| Linux   | arm64 / aarch64       | Yes                    |
| Windows | any                   | No (asdf is Unix-only) |

---

## Environment Variables

| Variable           | Description                                                                         |
| ------------------ | ----------------------------------------------------------------------------------- |
| `GITHUB_API_TOKEN` | GitHub personal access token for authenticated API requests (increases rate limits) |

---

## Contributing

Pull requests welcome. Please open an issue first for significant changes.

---

## License

[MIT](LICENSE)
