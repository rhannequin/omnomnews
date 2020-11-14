# Omnomnews ![specs](https://github.com/rhannequin/omnomnews/workflows/CI/badge.svg)

## Requirements

* Ruby 2.7.2
* Rails 6
* PostgreSQL ~11

## Initialization

```sh
$ bundle e rails db:prepare
```

## CI

[Project's Github Actions](https://github.com/rhannequin/omnomnews/actions)

## Test

```sh
$ bundle e rails db:prepare RAILS_ENV=test
$ bundle e rspec
```
