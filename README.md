# camelCaseNewsNetwork - Ruby on Rails Backend

The camelCaseNewsNetwork is an image based news browser created with vanilla Javascript and Ruby on Rails.

## API

This project consumes data supplied by the newsapi.org API. It uses the free version of the API, which limits the number of daily requests and the number of records returned from a request.

Request are made through the accompanying Ruby on Rails backend.

## Models

- articles
- categories
- countries
- favorites
- users

## Seed Data

This project requires a seeded database to run properly. Be sure to include credentials for newsapi.org and run `rails db:seed`.

## Credentials

The newsapi.org API requests require a key. Be sure to add it to config/config.rb. It should look like this:

```
CONFIG = {
    news_api_key: "abcdeabceeabcdeadbceadbce12"
 }
```

## License

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">camelCaseNewsNetwork</span> by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Clark Johnson</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>
