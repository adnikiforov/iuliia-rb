# Iuliia

Small gem to properly transliterate cyrillic to latin. Use https://github.com/nalgeon/iuliia for transliteration schemas.

![Ruby](https://github.com/adnikiforov/iuliia-rb/workflows/Ruby/badge.svg)

## Installation

#### Gem has been renamed to `iuliia`. This is the last version of `iuliia-rb`. Please, use `iuliia` instead.

Add this line to your application's Gemfile:

```ruby
gem 'iuliia'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iuliia

## Usage

Get available schemas (dynamically generated from JSON definitions in `lib/schemas`)
```ruby
Iuliia::Schema.available_schemas

[
    ['mvd_310', 'MVD 310-1997 transliteration schema'], 
    ['bs_2979', 'British Standard 2979:1958 transliteration schema'], 
    ['gost_779_alt', 'GOST 7.79-2000 (aka ISO 9:1995) transliteration schema'], 
    ['icao_doc_9303', 'ICAO DOC 9303 transliteration schema'], 
    ['mvd_310_fr', 'MVD 310-1997 transliteration schema'], 
    ['mvd_782', 'MVD 782-2000 transliteration schema'], 
    ['iso_9_1968_alt', 'ISO/R 9:1968 transliteration schema'], 
    ['mosmetro', 'Moscow Metro map transliteration schema'], 
    ['gost_7034', 'GOST R 7.0.34-2014 transliteration schema'], 
    ['gost_16876_alt', 'GOST 16876-71 (aka GOST 1983) transliteration schema'], 
    ['gost_52290', 'GOST R 52290-2004 transliteration schema'], 
    ['ungegn_1987', 'UNGEGN 1987 V/18 transliteration schema'], 
    ['telegram', 'Telegram transliteration schema'], 
    ['gost_16876', 'GOST 16876-71 (aka GOST 1983) transliteration schema'], 
    ['gost_779', 'GOST 7.79-2000 (aka ISO 9:1995) transliteration schema'], 
    ['wikipedia', 'Wikipedia transliteration schema'], 
    ['bgn_pcgn', 'BGN/PCGN transliteration schema'], 
    ['iso_9_1968', 'ISO/R 9:1968 transliteration schema'], 
    ['yandex_money', 'Yandex.Money transliteration schema'], 
    ['ala_lc', 'ALA-LC transliteration schema.'], 
    ['yandex_maps', 'Yandex.Maps transliteration schema'], 
    ['gost_52535', 'GOST R 52535.1-2006 transliteration schema'], 
    ['bgn_pcgn_alt', 'BGN/PCGN transliteration schema'], 
    ['iso_9_1954', 'ISO/R 9:1954 transliteration schema'], 
    ['bs_2979_alt', 'British Standard 2979:1958 transliteration schema'], 
    ['scientific', 'Scientific transliteration schema'], 
    ['ala_lc_alt', 'ALA-LC transliteration schema.']
]
```

Pick one and transliterate

```ruby
Iuliia.translit('Юлия, съешь ещё этих мягких французских булок из Йошкар-Олы, да выпей алтайского чаю', schema: 'mvd_782')

"Yuliya, syesh' eshche etikh myagkikh frantsuzskikh bulok iz Yoshkar-Oly, da vypey altayskogo chayu"
```

## TODO

* ~~Add documentation~~
* Maybe some more specs
* Implement reverse translit (not available for all schemas though): https://github.com/adnikiforov/iuliia-rb/issues/3

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
