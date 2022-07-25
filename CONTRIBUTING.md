# Contributing guide

**Want to contribute? Great!**

All contributions are more than welcome ! This includes bug reports, bug fixes, enhancements, features, questions, ideas,
and documentation.

This document will hopefully help you contribute to pgopr.

* [Legal](#legal)
* [Reporting an issue](#reporting-an-issue)
* [Building the main branch](#building-the-main-branch)
* [Before you contribute](#before-you-contribute)
* [Code reviews](#code-reviews)
* [Coding Guidelines](#coding-guidelines)
* [Discuss a Feature](#discuss-a-feature)
* [Development](#development)

## Legal

All contributions to pgopr-images are licensed under the [MIT](https://opensource.org/licenses/MIT).

## Reporting an issue

This project uses GitHub issues to manage the issues. Open an issue directly in GitHub.

If you believe you found a bug, and it's likely possible, please indicate a way to reproduce it, what you are seeing and what you would expect to see.
Don't forget to indicate your pgopr version.

## Get the main branch

Get the `main` branch:

```
git clone https://github.com/pgopr/pgopr-images.git
cd pgopr-images
```

## Before you contribute

To contribute, use GitHub Pull Requests, from your **own** fork.

Also, make sure you have set up your Git authorship correctly:

```
git config --global user.name "Your Full Name"
git config --global user.email your.email@example.com
```

We use this information to acknowledge your contributions in release announcements.

## Code reviews

GitHub pull requests can be reviewed by all such that input can be given to the author(s).

See [GitHub Pull Request Review Process](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests/about-pull-request-reviews)
for more information.

## Coding Guidelines

* Discuss the feature
* Do development
  + Follow the code style
* Commits should be atomic and semantic. Therefore, squash your pull request before submission and keep it rebased until merged
  + If your feature has independent parts submit those as separate pull requests

## Discuss a Feature

You can discuss bug reports, enhancements and features in our [forum](https://github.com/pgopr/pgopr-images/discussions).

Once there is an agreement on the development plan you can open an issue that will used for reference in the pull request.

## Development

You can follow this workflow for your development.

Add your repository

```
git clone git@github.com:yourname/pgopr-images.git
cd pgopr-images
git remote add upstream https://github.com/pgopr/pgopr-images.git
```

Create a work branch

```
git checkout -b mywork main
```

During development

```
git commit -a -m "[#issue] My feature"
git push -f origin mywork
```

If you have more commits then squash them

```
git rebase -i HEAD~2
git push -f origin mywork
```

If the `main` branch changes then

```
git fetch upstream
git rebase -i upstream/main
git push -f origin mywork
```

as all pull requests should be squashed and rebased.

In your first pull request you need to add yourself to the `AUTHORS` file.
