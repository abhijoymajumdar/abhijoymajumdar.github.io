---
layout: home
title: Blog
subtitle: Let's discuss
---

# Ruby Date Format to show dates of posts
date_format: "%B %-d, %Y"

# Output options (more information on Jekyll's site)
timezone: "America/Toronto"
markdown: kramdown
highlighter: rouge
permalink: /:year-:month-:day-:title/
#paginate: 5

kramdown:
  input: GFM

# Default YAML values (more information on Jekyll's site)
defaults:
  -
    scope:
      path: ""
      type: "posts"
    values:
      layout: "post"
      comments: true  # add comments to all blog posts
      social-share: true # add social media sharing buttons to all blog posts