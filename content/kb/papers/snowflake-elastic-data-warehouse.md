---
title: "Snowflake: The Elastic Data Warehouse"
linkTitle: Snowflake (SIGMOD '16)
date: 2026-11-25
description: Separating storage from compute for a multi-tenant cloud data warehouse.
paper:
  full_title: The Snowflake Elastic Data Warehouse
  authors: [Benoit Dageville, et al.]
  venue: SIGMOD
  year: 2016
  url: https://doi.org/10.1145/2882903.2903741
venues: [SIGMOD]
tags: [cloud-warehouse, storage-compute-separation, columnar]
status: reading
draft: true # example note — verify, expand, then delete this line
---

## TL;DR {#tldr}

Snowflake is built for the cloud from the start. It keeps table data in object storage (S3) and runs queries on independent, elastic compute clusters called *virtual warehouses*.

## Problem {#problem}

Shared-nothing warehouses couple storage and compute, which makes elasticity, multi-tenancy and handling semi-structured data hard in the cloud.

## Key ideas {#key-ideas}

- **Multi-cluster, shared-data architecture**: a storage layer (object store), a compute layer (virtual warehouses) and a cloud-services layer (metadata, optimizer, transactions, security).
- **Immutable micro-partitions**: tables are split into columnar files with min/max metadata for pruning.
- **Local caching**: workers cache table files on local SSD; files are assigned to workers by consistent hashing.
- **Snapshot isolation via MVCC** on immutable files, which also gives *Time Travel* and zero-copy cloning.
- **Semi-structured data** through the `VARIANT` type, with automatic columnarization of common paths.

## Design details {#design}

## Evaluation {#evaluation}

## Strengths and limitations {#critique}

## How it connects {#connections}

- Concept: [Columnar storage]({{< relref "/kb/concepts/columnar-storage" >}})

## Open questions {#questions}
