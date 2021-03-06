# Changelog
All notable changes to this project will be documented in this file.

---

## [1.1.0](https://github.com/abbotto/shell-api/releases/tag/v1.1.0) - 2019-07-22
### Added
- [export-file](doc/api.md#export-file)
    - Accept multiple files as arguments.
    - Trim whitespace from unquoted environment variables.
- Increase the number of shells used for testing scripts.

### Changed
- Loop over shell environment list when testing intstead of using multiple files.
- Renamed multiple variables.
- Update the commit message types.
- Update the documentation for [export-file](doc/api.md#export-file).
- Use the correct letter case for variables.

### Removed
- Deleted files for running tests in multiple shell environments.

## [1.0.0](https://github.com/abbotto/shell-api/releases/tag/v1.0.0) - 2018-09-17
### Added
- `changelog` file.
- [export-file](doc/api.md#export-file) function.

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
- Placeholder support for the [pipe-file](doc/api.md#pipe-file) function.

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