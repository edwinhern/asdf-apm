# asdf-apm

[![CI](https://github.com/edwinhern/asdf-apm/actions/workflows/workflow.yml/badge.svg)](https://github.com/edwinhern/asdf-apm/actions/workflows/workflow.yml)

[asdf](https://asdf-vm.com) / [mise](https://mise.jdx.dev) plugin for installing [Agent Package Manager (APM)](https://github.com/microsoft/apm).

## Install with mise

```shell
mise plugin install apm https://github.com/edwinhern/asdf-apm
```

```shell
# Show all installable versions
mise ls-remote apm

# Install specific version
mise install apm@latest

# Set a version globally
mise use --global apm@latest

# Now apm commands are available
apm --version
```

## Install with asdf

```shell
asdf plugin add apm https://github.com/edwinhern/asdf-apm
```

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

Check [mise](https://mise.jdx.dev) or [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

---

## Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

## License

See [LICENSE](LICENSE) © [Edwin Hernandez](https://github.com/edwinhern/)
