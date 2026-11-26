---
title: "{{ replace .File.ContentBaseName "-" " " | title }}"
date: {{ .Date }}
description: "" # one-line: what the paper contributes
paper:
  full_title: ""
  authors: []
  venue: ""      # e.g. SIGMOD, VLDB, CIDR, ICDE, OSDI
  year: 0
  url: ""        # DOI or public link
  pdf: "{{ .File.ContentBaseName }}.pdf" # local copy in library/ (not published)
venues: []       # same as paper.venue, so it appears under /venues/
tags: []         # e.g. query-optimization, storage, cloud-warehouse
status: reading  # reading | read | revisit
draft: true
---

## TL;DR {#tldr}

<!-- 2-3 sentences in your own words. -->

## Problem {#problem}

## Key ideas {#key-ideas}

## Design details {#design}

## Evaluation {#evaluation}

## Strengths and limitations {#critique}

## How it connects {#connections}

<!-- Link related concepts and systems with relref; see README "Write something". -->

## Open questions {#questions}
