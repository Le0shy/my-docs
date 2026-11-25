---
title: Columnar storage
date: 2026-11-25
description: Storing each column separately to speed up analytical scans.
tags: [storage, olap, columnar]
weight: 10
draft: true # example page — verify, expand, then delete this line
---

## What it is {#what}

A column store keeps the values of each column together on disk, instead of storing whole rows together.

## Why it matters {#why}

Analytical queries usually read a few columns across many rows. Columnar layout reads only the needed columns and compresses well, because the values in a column are similar.

## How it works {#how}

- **Compression**: run-length, dictionary, delta and bit-packing encodings.
- **Late materialization**: work on column positions and build tuples as late as possible.
- **Vectorized execution**: process batches of column values per operator call.

## Variants and trade-offs {#tradeoffs}

- Pure columnar vs. hybrid PAX layouts (row groups with column chunks, as in Parquet and ORC).
- Fast scans vs. expensive single-row updates.

## In real systems {#systems}

## Key papers {#papers}

- C-Store: A Column-oriented DBMS (VLDB 2005)
- MonetDB/X100: Hyper-Pipelining Query Execution (CIDR 2005)
- [Snowflake (SIGMOD 2016)]({{< relref "/kb/papers/snowflake-elastic-data-warehouse" >}})

## History {#history}
