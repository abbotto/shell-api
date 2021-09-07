# Changelog
All notable changes to this project will be documented in this file.

---
## [2.0.0](https://github.com/abbotto/shell-api/releases/tag/v2.0.0) - 2021-10-04
### Added
- [make-text](doc/read/api.md#make-text) function
- [spec](doc/read/api.md#spec) function
- Ability to pipe into the [confirm](doc/read/api.md#confirm) function
- Ability to pipe into the [join-file](doc/read/api.md#join-file) function
- Ability to pipe into the [substring](doc/read/api.md#substring) function
- Ability to specify a line number in [read-file](doc/read/api.md#read-file) function
- Custom issue templates
- Development utilities
- Support `ash`, `ksh93`, `mksh`, and `yash` shells

### Changed
- Bundle all API functions into single script
- Decouple `set -eu` from `strict_mode` so those options can be set independently
- Fixed issues related to cross-shell support
- Improve arguments handling
- Improve build system
- Improve documentation
- Improve error handling
- Improve POSIX compatibility in [strict_mode](doc/read/api.md#strict_mode) file
- Improve testing
- Refactor [export-file](doc/read/api.md#export-file) function
- Refactor [log-text](doc/read/api.md#log-text) function
- Refactor `./src/api/shell-api` script
- Rename `log-level` to [log-text](doc/read/api.md#log-text)
- Use `trap` command for cleanup

### Removed
- `npm` support
- `set -o pipefail` because it's unsupported in non-bash shells
- `fish` shell references

## [1.1.0](https://github.com/abbotto/shell-api/releases/tag/v1.1.0) - 2019-07-22
### Added
- [export-file](doc/read/api.md#export-file)
    - Accept multiple files as arguments.
    - Trim whitespace from unquoted environment variables.
- Increase the number of shells used for testing scripts.

### Changed
- Loop over shell environment list when testing intstead of using multiple files.
- Renamed multiple variables.
- Update the commit message types.
- Update the documentation for [export-file](doc/read/api.md#export-file).
- Use the correct letter case for variables.

### Removed
- Deleted files for running tests in multiple shell environments.

## [1.0.0](https://github.com/abbotto/shell-api/releases/tag/v1.0.0) - 2018-09-17
### Added
- `changelog` file.
- [export-file](doc/read/api.md#export-file) function.

### Changed
- Updated examples.
- Improved testing.
- Code refactoring.

### Removed
- `import` function.

### Fixed
- Ensure aliases are expanded.

## [0.2.0](https://github.com/abbotto/shell-api/releases/tag/v0.2.0) - 2018-08-05
### Added
- Placeholder support for the [pipe-file](doc/read/api.md#pipe-file) function.

## [0.1.1](https://github.com/abbotto/shell-api/releases/tag/v0.1.1) - 2018-08-03
### Changed
- Fixed a documentation typo.

## [0.1.0](https://github.com/abbotto/shell-api/releases/tag/v0.1.0) - 2018-08-01
### Added
- Build tools.
- Configuration files.
- API functions.
- Tests.

---

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
