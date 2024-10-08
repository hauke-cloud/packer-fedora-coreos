# Contributing Guidelines

Thank you for your interest in contributing to our project.
Whether it's a bug report, new feature, correction, or additional
documentation, we greatly value feedback and contributions from our community.

Please read through this document before submitting any issues or pull requests
to ensure we have all the necessary
information to effectively respond to your bug report or contribution.

<!-- TOC -->

- [Contributing Guidelines](#contributing-guidelines)
  - [Requirements](#requirements)
    - [Mandatory](#mandatory)
    - [Recommended](#recommended)
  - [Local Development Setup](#local-development-setup)
    - [Install Visual Studio Code recommended extensions](#install-visual-studio-code-recommended-extensions)
    - [Install pre-commit hooks](#install-pre-commit-hooks)
    - [Execute pre-commit hooks manually on all files](#execute-pre-commit-hooks-manually-on-all-files)
    - [Update pre-commit hooks](#update-pre-commit-hooks)
  - [Reporting Bugs/Feature Requests](#reporting-bugsfeature-requests)
  - [Contributing via Pull Requests](#contributing-via-pull-requests)
  - [Finding contributions to work on](#finding-contributions-to-work-on)
  - [Licensing](#licensing)

<!-- /TOC -->

## Requirements

The following tools need to be installed on your local machine:

### Mandatory

- [pre-commit](https://pre-commit.com/)

### Recommended

- [oh-my-zsh](https://ohmyz.sh/)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [spaceship-prompt](https://github.com/spaceship-prompt/spaceship-prompt)

## Local Development Setup

Run these steps before making changes to the code. They will help automate the
commands to lint the code or run tests. These steps help to ensure high code
quality and reduce the likelihood that the changes inadvertently break something.

### Install pre-commit hooks

This will ensure that the commands we want to execute
before each commit are executed automatically.

```shell
pre-commit install
```

### Execute pre-commit hooks manually on all files

```shell
pre-commit run --all-files
```

### Update pre-commit hooks

```shell
pre-commit autoupdate
```

## Reporting Bugs/Feature Requests

We welcome you to use the GitHub issue tracker to report bugs or suggest
features.

When filing an issue, please check existing open, or recently closed, issues
to make sure somebody else hasn't already
reported the issue. Please try to include as much information as you can.
Details like these are incredibly useful:

- A reproducible test case or series of steps
- The version of our code being used
- Any modifications you've made relevant to the bug
- Anything unusual about your environment or deployment

## Contributing via Pull Requests

Contributions via pull requests are much appreciated.
Before sending us a pull request, please ensure that:

1. You are working against the latest source on the *main* branch.
2. You check existing open, and recently merged, pull requests to make sure
someone else hasn't addressed the problem already.
3. You open an issue to discuss any significant work - we would hate for
your time to be wasted.

To send us a pull request, please:

1. Fork the repository.
2. Modify the source; please focus on the specific change you are contributing.
If you also reformat all the code, it will be hard for us to focus on your change.
3. Ensure local tests pass.
4. Commit to your fork using clear commit messages.
5. Send us a pull request, answering any default questions in the pull request interface.
6. Pay attention to any automated CI failures reported in the pull request,
and stay involved in the conversation.

GitHub provides additional document on [forking a repository](https://help.github.com/articles/fork-a-repo/) and
[creating a pull request](https://help.github.com/articles/creating-a-pull-request/).

## Finding contributions to work on

Looking at the existing issues is a great way to find something to contribute on.
As our projects, by default, use the default GitHub issue labels
(enhancement/bug/duplicate/help wanted/invalid/question/wontfix),
looking at any 'help wanted' issues is a great place to start.

## Licensing

See the [LICENSE](LICENSE) file for our project's licensing.
We will ask you to confirm the licensing of your contribution.
