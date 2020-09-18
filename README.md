# Github Wiki Publish Action

This [GitHub Action][github actions]
publishes the contents of a directory to your project's [wiki][github wiki]
from a workflow.

## Usage

In a new or existing workflow,
add a step using `SwiftDocOrg/github-wiki-publish-action@v1`
with a path to a directory containing the documentation you wish to upload.

```yml
name: Documentation

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v1
      # Additional steps to generate documentation in "Documentation" directory
      - name: Upload Documentation to Wiki
        uses: SwiftDocOrg/github-wiki-publish-action@v1
        with:
          path: "Documentation"
        env:
          GH_PERSONAL_ACCESS_TOKEN: ${{ secrets.GH_PERSONAL_ACCESS_TOKEN }}
```

## Setup

This GitHub action requires that your repository has the following:

- A wiki with at least one page in it
- A secret named `GH_PERSONAL_ACCESS_TOKEN`
  with a Github personal access token with "repo" authorization

Follow the steps below to ensure that everything's configured correctly.

> **Note**
> GitHub doesn't currently provide APIs for interacting with project wikis,
> so much of the required setup must be done manually.

### 1. Enable Your Repository's Wikis Feature

Navigate to the "Settings" tab for your repository,
scroll down to the "Features" section,
and ensure that the checkbox labeled "Wikis" is checked.

![GitHub Wikis Feature](https://user-images.githubusercontent.com/7659/72726104-5f3aff80-3b3c-11ea-8f2e-fe73aff0276b.png)

### 2. Create the First Wiki Page

With the Wikis feature enabled for your repository,
navigate to the "Wiki" tab.
If prompted,
create the first wiki page.

![GitHub Wiki Create First Page](https://user-images.githubusercontent.com/7659/72726186-927d8e80-3b3c-11ea-8014-4622f8ff3226.png)

### 3. Generate a Personal Access Token

Navigate to the [Personal access tokens](https://github.com/settings/tokens) page
in your GitHub account settings
(Settings > Developer settings > Personal access tokens)
and click the "Generate a new token" button.

In the "New personal access token" form,
provide a descriptive comment in the "Note" field, like "Wiki Management".
Under "Select scopes",
enable all of the entries under "repo" perms.

When you're done,
click the "Generate token" button at the bottom of the form.

![GitHub Personal Access Token Select Scopes](https://user-images.githubusercontent.com/7659/72726210-9f9a7d80-3b3c-11ea-81b4-528de92fb9fa.png)

> **Note**:
> GitHub actions have access to [a `GITHUB_TOKEN` secret][GITHUB_TOKEN],
> but that token's permissions are limited to
> the repository that contains your workflow.
> This workflow requires the generation of a new personal access token
> to read and write to the git repository for your project's wiki.

### 4. Set a Repository Secret

Copy your generated personal access token to the clipboard
and navigate to your project settings.
Navigate to the "Secrets" page,
click "Add a new secret",
and fill in the form by
entering `GH_PERSONAL_ACCESS_TOKEN` into the "Name" field and
pasting your token into the "Value" field.

## License

MIT

## Contact

Mattt ([@mattt](https://twitter.com/mattt))

[github actions]: https://help.github.com/en/actions
[github wiki]: https://help.github.com/en/github/building-a-strong-community/about-wikis
[GITHUB_TOKEN]: https://help.github.com/en/actions/automating-your-workflow-with-github-actions/authenticating-with-the-github_token#about-the-github_token-secret
