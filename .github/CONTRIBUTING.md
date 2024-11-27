# Contributing to a SiliconLabs open source project

You want to contribute to a Silicon Labs Open Source project? Welcome! Please read this document to understand what you can do:
 * [Help Others](#help-others)
 * [Analyze Issues](#analyze-issues)
 * [Report an Issue](#report-an-issue)
 * [Contribute Code](#contribute-code)

## Help Others

You can help the Silicon Labs open source projects by helping others who use them and need support.

## Analyze Issues

Analyzing issue reports can be a lot of effort. Any help is welcome!
Go to [Issue tracker](https://github.com/SiliconLabsSoftware/bluetooth-AoA-example/issues?q=is%3Aopen+is%3Aissue)  and find an open issue which needs additional work or a bugfix (e.g. issues labeled with "help wanted" or "bug").

Additional work could include any further information, or a gist, or it might be a hint that helps understanding the issue. Maybe you can even find and [contribute](#contribute-code) a bugfix?

## Report an Issue

If you find a bug - behavior of Silicon Labs Open Source projects code contradicting your expectation - you are welcome to report it.
We can only handle well-reported, actual bugs, so please follow the guidelines below.

Once you have familiarized with the guidelines, you can go to the [Create an issue](https://github.com/SiliconLabsSoftware/bluetooth-AoA-example/issues/new) to report the issue.

### Quick Checklist for Bug Reports

Issue report checklist:
 * Real, current bug
 * No duplicate
 * Reproducible
 * Good summary
 * Well-documented
 * Minimal example


### Issue handling process

When an issue is reported, a committer will look at it and either confirm it as a real issue, close it if it is not an issue, or ask for more details.

An issue that is about a real bug is closed as soon as the fix is committed.


### Reporting Security Issues

If you find a security issue, please act responsibly and report it not in the public issue tracker, but directly to the CODE_OWNERS, so we can fix it before it can be exploited.


### Usage of Labels

GitHub offers labels to categorize issues. We defined the following labels so far:

Labels for issue categories:
 * bug: this issue is a bug in the code
 * feature: this issue is a request for a new functionality or an enhancement request

Status of open issues:
 * help wanted: the feature request is approved and you are invited to contribute

Status/resolution of closed issues:
 * wontfix: while acknowledged to be an issue, a fix cannot or will not be provided

The labels can only be set and modified by committers.


### Issue Reporting Disclaimer

We want to improve the quality of Silicon Labs Open Source projects and good bug reports are welcome! But our capacity is limited, thus we reserve the right to close or to not process insufficient bug reports in favor of those which are very cleanly documented and easy to reproduce. Even though we would like to solve each well-documented issue, there is always the chance that it will not happen - remember: these projects are open source and comes without warranty.

Bug report analysis support is very welcome! (e.g. pre-analysis or proposing solutions)


## Contribute Code

You are welcome to contribute code to Silicon Labs Open Source projects in order to fix bugs or to implement new features.

There are three important things to know:

1.  You must be aware that you need to sign a [CLA](https://en.wikipedia.org/wiki/Contributor_License_Agreement) in order for your contribution to be accepted. This is common practice in all major Open Source projects.
2.  There are **several requirements regarding code style, quality, and product standards** which need to be met (we also have to follow them). The respective section below gives more details on the coding guidelines.


### Contribution Content Guidelines

These are some of the rules we try to follow:

-   Apply a clean coding style adapted to the surrounding code, even though we are aware the existing code is not fully clean
-   Use (4)spaces for indentation (except if the modified file consistently uses tabs)
-   Use variable naming conventions like in the other files you are seeing (camelcase)
-   No console.log() - use logging service
-   Run the ESLint code check and make it succeed
-   Comment your code where it gets non-trivial
-   Keep an eye on performance and memory consumption, properly destroy objects when not used anymore
-   Write a unit test
-   Do not do any incompatible changes, especially do not modify the name or behavior of public API methods or properties

### How to contribute - the Process

1.  Make sure the change would be welcome (e.g. a bugfix or a useful feature); best do so by proposing it in a GitHub issue
2.  Create a branch forking the cla-assistant repository and do your change
3.  Commit and push your changes on that branch
4.  In the commit message
 - Describe the problem you fix with this change.
 - Describe the effect that this change has from a user's point of view. App crashes and lockups are pretty convincing for example, but not all bugs are that obvious and should be mentioned in the text.
 - Describe the technical details of what you changed. It is important to describe the change in a most understandable way so the reviewer is able to verify that the code is behaving as you intend it to.
5.  If your change fixes an issue reported at GitHub, add the following line to the commit message:
    - ```Fixes #(issueNumber)```
    - Do NOT add a colon after "Fixes" - this prevents automatic closing.
6.  Create a Pull Request
7.  Follow the link posted by the Silicon Labs Open Source projects to your pull request and accept it, as described in detail above.
8.  Wait for our code review and approval, possibly enhancing your change on request
    -   Note that the Silicon Labs Open Source projects developers also have their regular duties, so depending on the required effort for reviewing, testing and clarification this may take a while

9.  Once the change has been approved we will inform you in a comment
10.  We will close the pull request, feel free to delete the now obsolete branch
