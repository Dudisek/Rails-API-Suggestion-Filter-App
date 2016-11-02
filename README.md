# Run
```
bundle install
rake db:setup && rake db:seed
rails s
```

# Test
```
rspec
```

# Data
```
GET /suggestions?q=Tetri&minprice=10&maxprice=100&cat=1
```


# Requirements:

### Dentalzon Coding Challenge

Design an API endpoint that provides auto-complete suggestions for products.

- the endpoint is exposed at `/suggestions`
- the partial (or complete) search term is passed as a querystring parameter `q`
- the endpoint returns a JSON response with an array of suggested matches
- the final application should be [deployable to Heroku](https://devcenter.heroku.com/articles/rack).
- the caller can optionally supply via querystring parameters price range(minprice and maxprice) and category to help improve relative scores
- build the model as you see fit, you can use sqlite, mysql, postgres or mock
- Your model should have:
    - a name which can be used to disambiguate between similarly named products
    - a price
    - an image
    - a category
    - a category name i18n [en,es]
- feel free to add more features if you like!

#### Sample responses

These responses are meant to provide guidance. The exact values can vary based on the data source and scoring algorithm

**Near match**

    GET /suggestions?q=Tetri&minprice=10&maxprice=100&cat=1

```json
{
  "suggestions": [
    {
      "name": "Tetric Evoc Spr A2 3x3g",
      "image": "https://dentalzon-i-images.s3.amazonaws.com/images/listing_images/images/773744/big/57240-57240-large.jpg?1475768943",
      "price": "88.49",
      "category": { "id": 1, "trans": {"en": "Filling materials", "es": "Los materiales de relleno"}}
    },
    {
      "name": "A1 TETRIC EVOCERAM JER. 3gr.",
      "image": "https://dentalzon-i-images.s3.amazonaws.com/images/listing_images/images/773734/big/57239-57239-large.jpg?1475768942",
      "price": "31.52",
      "category": { "id": 1, "trans": {"en": "Filling materials", "es": "Los materiales de relleno"}}
    },
    {
      "name": "Tetric Evoc Spr B3 3g",
      "latitude": "https://dentalzon-i-images.s3.amazonaws.com/images/listing_images/images/773734/big/57239-57239-large.jpg?1475768942",
      "longitude": "31.52",
      "category": { "id": 1, "trans": {"en": "Filling materials", "es": "Los materiales de relleno"}}
    }
  ]
}
```

**No match**

    GET /suggestions?q=SomeRandomProductThatDoesntExist

```json
{
  "suggestions": []
}
```


### Non-functional

- All code should be written in Ruby
- To build the model use active record migration
- Documentation and maintainability is a plus
- Rspec test some method(s) in the API.
