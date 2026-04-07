# asdf-apm

[![CI](https://github.com/edwinhern/asdf-apm/actions/workflows/workflow.yml/badge.svg)](https://github.com/edwinhern/asdf-apm/actions/workflows/workflow.yml)

[Agent Package Manager (APM)](https://github.com/microsoft/apm) plugin for [asdf](https://asdf-vm.com).

APM is an open-source dependency manager for AI agents by Microsoft. It provides manifest-based configuration via `apm.yml`, similar to `package.json` for npm, with transitive dependency resolution and content security scanning.

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
asdf install apm 0.8.11
```

### Set the version

```bash
# Set globally
asdf set -u apm latest

# Set locally (writes to .tool-versions in current directory)
asdf set -p apm 0.8.11
```

### Verify

```bash
apm --version
```

---

## Usage with `.tool-versions`

Add a `.tool-versions` file to your project:

```txt
apm 0.8.11
```

Then run:

```bash
asdf install
```

---

## Available Versions

```bash
asdf list all apm
```

---

## Contributing

Pull requests welcome. Please open an issue first for significant changes.

---

## License

[MIT](LICENSE)
