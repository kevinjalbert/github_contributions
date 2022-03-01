# GitHub Contributions

> Ever wanted to know where you (or someone else) are making contributions on GitHub?

Your GitHub profile shows you the [Contributions Calendar](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/managing-contribution-graphs-on-your-profile/viewing-contributions-on-your-profile#contributions-calendar) and [Contribution activity](https://docs.github.com/en/account-and-profile/setting-up-and-managing-your-github-profile/managing-contribution-graphs-on-your-profile/viewing-contributions-on-your-profile#contribution-activity), which both provide great visualizations and details covering contributions of the following:

  - creating/closing issues
  - creating/closing/merging/reviewing pull requests
  - creating repositories
  - authoring commits on the main branch of repositories
  - starting/answering discussions

I personally wanted to track comments on issues and pull requests as I felt they were a good indication of contributions. It sometimes isn't uncommon for a lot of discussions to happen on issues or even a pull request.

I am a fan of [Obsidian](https://obsidian.md/) right now to track my day at work. Recording these contributions in GitHub makes it simple to recall what I did in previous days/weeks. This is even more important if you have a [_BragDoc_](https://jvns.ca/blog/brag-documents/). As Obsidian uses Markdown, that is the primary format that this tool is built for.

## Install

```bash
gem install github_contributions
```

You need a GitHub Personal Access Token in your ENVs as `GITHUB_ACCESS_TOKEN` for this gem to work.

## Usage

```bash
# Show me contributions for 'kevinjalbert' for today
github_contributions -a "kevinjalbert"

# Show me contributions for 'kevinjalbert' for today only in the 'shopify' org
github_contributions -a "kevinjalbert" -o "shopify"

# Show me contributions for 'kevinjalbert' in the last week
github_contributions -a "kevinjalbert" -s "last week"

# Show me contributions for 'kevinjalbert' for the week before last
github_contributions -a "kevinjalbert" -s "two weeks ago" -e "one week ago"

# Show me contributions for 'kevinjalbert' for only yesterday
github_contributions -a "kevinjalbert" -s "yesterday" -e "yesterday"

# Help
github_contributions -h
```

Contributions are grouped by their pull request or issue in order of creation time. This ends up producing a rather detailed list of where contributions were made in the specified time frame. Links are present to easily allow you to jump directly to the contribution. Everything is displayed in Markdown, ready to be copy/pasted where desired. The following is an example of what the output looks like:

- [Support function in `message` expectation in `t.throws` / `t.throwsAsync`](https://github.com/avajs/ava/issues/2978) by [sindresorhus](https://github.com/sindresorhus)
  - [Issue Opened at 2022-02-26 08:42:19 UTC](https://github.com/avajs/ava/issues/2978)
  - [IssueComment Created at 2022-02-26 08:43:12 UTC](https://github.com/avajs/ava/issues/2978#issuecomment-1051842838)
- [Use `for..of` loop](https://github.com/sindresorhus/string-width/pull/40) by [fisker](https://github.com/fisker)
  - [PullRequestReviewComment Created at 2022-02-28 08:18:52 UTC](https://github.com/sindresorhus/string-width/pull/40#discussion_r815662489)
  - [PullRequestReview Created at 2022-02-28 08:18:52 UTC](https://github.com/sindresorhus/string-width/pull/40#pullrequestreview-894766255)
  - [PullRequest Closed at 2022-02-28 08:20:12 UTC](https://github.com/sindresorhus/string-width/pull/40)
  - [IssueComment Created at 2022-02-28 08:20:16 UTC](https://github.com/sindresorhus/string-width/pull/40#issuecomment-1054001902)
