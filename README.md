# Introduction

`static-synapses` is a demonstration of a simple recommendation system for static websites. It is inspired by the video [Modern Blogging Problems, Require Good Engineering Solutions](https://odysee.com/@bugswriter:8/modern-blogging-problems,-require-good:9).

- [Demo](https://static-synapses.demos.rehandaphedar.com)

# Dependencies

- sed
- [findlike](https://github.com/brunoarine/findlike)
- [yq](https://github.com/mikefarah/yq)

# Usage

The script `add-recommendations.sh` expects your target pages in a directory structure like this (The name of the markdown files doesn't matter):

```
content/posts
├── post-1.md
├── post-2.md
├── post-3.md
├── post-4.md
└── post-5.md
```

After setting up the directory structure, go through `add-recommendations.sh`, change any variables to customize behavior, and run `./add-recommendations.sh`.

The script will update each of your markdown files with a `# Similar Posts` heading (Or whatever you set `$SSP_HEADING` to). After this, you will need to rebuild your site.

This example uses Hugo, but it should be easily adaptable to other static site generators. Be careful, however, about how you extract the title from a markdown/orgmode/etc. file (This example uses `yq` to extract markdown frontmatter), and how you obtain the permalink to the file (This example uses Hugo's `relref` shortcode.).

# Limitations

- There is currently no option to selectively replace a markdown heading that is *not* the last heading of the file.
- The directory structure expected is rigid. Directory structures like `content/posts/post-1/index.md` are untested and may or may not work.
- Similarly, linking across folders/categories (For example, between `content/articles`, `content/tutorials`, `content/microblog`) is untested and may or may not work.
- If a page has no other pages that meet the `$SSP_MIN_THRESHOLD`, a `$SSP_HEADING` is still added.
