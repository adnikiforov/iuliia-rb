# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.1] - 2020-09-25
#### Deprecations
Method `translit` now deprecated, use `translate` instead. Will be removed completely in the future releases.
#### Improvements
Now call for translate with wrong (non-existent) schema will throw more human-friendly exception.

## [1.0.0] - 2020-09-14
This is the new initial version for gem `iuliia` after renaming it from `iuliia-rb`

## [0.2.1] - 2020-09-14
Changes:
* Gem has been renamed to `iuliia`. This is the last version of `iuliia-rb`. Please, use `iuliia` instead.

## [0.2.0] - 2020-09-14
Changes:
* Moved `lib/schemas` to the git submodule `github.com/nalgeon/iuliia`
* Lazy loading for schemas

## [0.1.0] - 2020-04-30
### Initial release