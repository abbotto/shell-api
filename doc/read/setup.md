# 💾 Setup

[<< back to readme](../../README.md#contributing)

## System requirements

The system requirements can be installed by running:

```
> ./dev/util/setup.sh
```

### What's in the box?

#### [pipx](https://pipxproject.github.io/pipx/)

Creates an isolated environment for Python applications and their associated packages.

```
> pip install pipx
```

#### [commitizen](https://commitizen-tools.github.io/commitizen/)

A set of linting rules and tooling for standardized commit workflows. 

```
> pipx install commitizen
```

#### [pre-commit](https://pre-commit.com/)

Manages the installation and execution of any hook written in any language before every commit.

```
> pipx install pre-commit
> pre-commit install --hook-type commit-msg
> pre-commit install
```

[<< back to readme](../../README.md#contributing)
