# asdf-apm

[![CI](https://github.com/edwinhern/asdf-apm/actions/workflows/workflow.yml/badge.svg)](https://github.com/edwinhern/asdf-apm/actions/workflows/workflow.yml)

[asdf](https://asdf-vm.com) plugin for installing [Agent Package Manager (APM)](https://github.com/microsoft/apm).

## Install

Plugin

```shell
asdf plugin add apm https://github.com/edwinhern/asdf-apm
```

apm:

```shell
# Show all installable versions
asdf list all apm

# Install specific version
asdf install apm latest

# Set a version globally (on your ~/.tool-versions file)
asdf set -u apm latest

# Now apm commands are available
apm --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

---

## Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

## License

See [LICENSE](LICENSE) © [Edwin Hernandez](https://github.com/edwinhern/)
