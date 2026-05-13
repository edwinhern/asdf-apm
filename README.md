# asdf-apm

> **Archived** — If you use [mise](https://mise.jdx.dev), you no longer need this plugin. Install APM directly via the built-in GitHub backend:
>
> ```sh
> mise use github:microsoft/apm@latest
> ```
>
> This repo is kept for reference for [asdf](https://asdf-vm.com) users only.

---

[![CI](https://github.com/edwinhern/asdf-apm/actions/workflows/workflow.yml/badge.svg)](https://github.com/edwinhern/asdf-apm/actions/workflows/workflow.yml)

[asdf](https://asdf-vm.com) plugin for installing [Agent Package Manager (APM)](https://github.com/microsoft/apm).

## Install with asdf

```shell
asdf plugin add apm https://github.com/edwinhern/asdf-apm
```

```shell
# Show all installable versions
asdf list all apm

# Install specific version
asdf install apm latest

# Set a version globally
asdf set -u apm latest

# Now apm commands are available
apm --version
```

## License

See [LICENSE](LICENSE) © [Edwin Hernandez](https://github.com/edwinhern/)
