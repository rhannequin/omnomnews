# Omnomnews ![specs](https://github.com/rhannequin/omnomnews/workflows/CI/badge.svg)

## Requirements

* Ruby 2.7.2
* Rails 6
* PostgreSQL ~11

## Initialization

```sh
$ bundle e rails db:prepare
```

## Run

```sh
$ bundle e foreman start -f Procfile.dev
```

## CI

[Project's Github Actions](https://github.com/rhannequin/omnomnews/actions)

## Test

### Requirements

* `chromedriver` (`$ brew install chromedriver`)
* `$ bundle e rails db:prepare RAILS_ENV=test`

```sh
$ bundle e rspec
```
