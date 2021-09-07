# 💻 [Shell API](https://github.com/abbotto/shell-api)

[![GitHub version](https://badge.fury.io/gh/abbotto%2Fshell-api.svg)](https://badge.fury.io/gh/abbotto%2Fshell-api)
[![license](https://img.shields.io/badge/license-MIT-informational.svg)](./LICENSE)
[![actions](https://github.com/abbotto/shell-api/actions/workflows/test.yaml/badge.svg)](https://github.com/abbotto/shell-api/actions)

[Shell API](https://github.com/abbotto/shell-api) is a [POSIX-compatible](http://pubs.opengroup.org/onlinepubs/9699919799/) shell utility library.  

This library works in various Bourne-like shells on *nix systems.
- `ubuntu:latest`: Tested with `ash`, `bash`, `dash`, `ksh93`, `mksh`, `yash`, and `zsh`.
- `macos:latest`: Tested with `bash`, `dash`, `ksh93`, `mksh`, `yash`, and `zsh`.

---

## [Install](#install)

Get a copy of the latest release from [here](https://github.com/abbotto/shell-api/releases).  
Extract the contents of the release archive into a destination directory.

```sh
wget -c https://github.com/abbotto/shell-api/archive/refs/tags/release-2.0.0.tar.gz -O - | \
tar -zxvf /path/to/target/directory
```

### Script headers

The header in the release script is set to `#!/usr/bin/env sh` by default.  
The header can be changed to reference another supported shell if required:
```sh
#!/usr/bin/env <ash|bash|dash|ksh|mksh|yash|zsh>
```

---

## [Usage](#usage)

```sh
# Method A: Load the entire 'shell-api' library
. /path/to/shell-api
print_text 10 'hello world'

# Method B: Load specific library functions
. /path/to/shell-api print_text
print_text 10 'hello world'
```

| Features                                     | 🐚                                         |
| -------------------------------------------- | ------------------------------------------ |
| [confirm](doc/read/api.md#confirm)           | [export_file](doc/read/api.md#export_file) |
| [join_file](doc/read/api.md#join_file)       | [log_text](doc/read/api.md#log_text)       |
| [make_text](doc/read/api.md#make_text)       | [pipe_file](doc/read/api.md#pipe_file)     |
| [print_text](doc/read/api.md#print_text)     | [read_file](doc/read/api.md#read_file)     |
| [require](doc/read/api.md#require)           | [spec](doc/read/api.md#spec)               |
| [start_daemon](doc/read/api.md#start_daemon) | [stop_daemon](doc/read/api.md#stop_daemon) |
| [strict_mode](doc/read/api.md#strict_mode)   | [substring](doc/read/api.md#substring)     |
| [substring](doc/read/api.md#substring)       | [terminate](doc/read/api.md#terminate)     |
| [watch_daemon](doc/read/api.md#watch_daemon) | [write_file](doc/read/api.md#write_file)   |

---

## [Contributing](#contributing)
### [Getting Started](#getting-started)
#### Get a copy of the repository

```
> git clone https://github.com/abbotto/shell-api.git
```

Alternatively, the latest project archive can be downloaded from [here](https://github.com/abbotto/shell-api/archive/main.zip).

#### Read the project documentation

[Setup](doc/read/setup.md) | [Development](doc/read/development.md) | [Standards](doc/read/standards.md)
### [Issues and Pull Requests](#issues-and-pull-requests)

Feel free to open a unique [issue](https://docs.github.com/en/free-pro-team@latest/github/managing-your-work-on-github/about-issues) or submit a [PR](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/about-pull-requests).

[![open-issue-button](doc/asset/image/open-issue-button.png)](https://github.com/abbotto/shell-api/issues/new)
[![open-pr-button](doc/asset/image/open-pr-button.png)](https://github.com/abbotto/shell-api/compare)

---

## [Contact](#contact)

[shell-api@gitmsg.dev](mailto:shell-api@gitmsg.dev)

---

## [License](#license)

[MIT](LICENSE) © [Jared Abbott](https://github.com/abbotto/)

---

[![keep-a-changelog](https://img.shields.io/badge/keep%20a%20changelog-1.0.0-informational)](./CHANGELOG.md)
[![contributor-covenant](https://img.shields.io/badge/contributor%20covenant-1.4.0-informational.svg)](./CHANGELOG.md)
[![conventional-commits](https://img.shields.io/badge/conventional%20commits-1.0.0-informational.svg)](https://conventionalcommits.org)
[![make-a-readme](https://img.shields.io/badge/make%20a%20readme-101-informational.svg)](https://www.makeareadme.com/#readme-101)
[![semantic-versioning](https://img.shields.io/badge/semantic%20versioning-2.0.0-informational.svg)](https://semver.org/)
