# Coding Challenge

The scope of this challenge is to create an API application. We are mainly interested in code style and structure.

## Specifications
- [x] Use data from this dataset for your application: ​[Link](http://opendata-esri-de.opendata.arcgis.com/datasets/273bf4ae7f6a460fbf3000d73f7b2f76_0
)
- [x] Build a data importer that brings the data into your application
- [x] Build an endpoint that delivers the number of buildings per zip code
- [x] Build an endpoint that shows the distribution of years in which buildings were added to the dataset (​STR_DATUM​)
- [x] Make both endpoints filterable by zip codes

## Dependencies:

* Ruby 2.5.x
* SQLite3
* Data file (from the above link)

## Usage:

1. Install gems: `bundle install`
2. Create & Migrate DB: `rake db:create && rake db:migrate`
3. Import data: `rake 'data:import[<path_to_csv>, <batch_size>]'`
4. Start server: `rails s`
5. Go to http://localhost:3000/buildings

## Endpoints:

* `/buildings` -> First 100 buildings (Just for showcase)
* `/buildings/zipcode_distribution` -> Count grouped by zipcode
* `/buildings/year_distribution` -> Count grouped by year

**Filtering:**
* You can filter any endpoint with a `zipcode` query string, like so:
```
    http://localhost:3000/buildings?zipcode=10115
    http://localhost:3000/buildings/zipcode_distribution?zipcode=10115
    http://localhost:3000/buildings/year_distribution?zipcode=10115
```

## Data Model

Column name | Description  | Data Type
----------- | ------------ | ----------
objectid    | Original ID | INT
adressid    | Address ID   | INT
hnr         | House number without additional information | INT
hnr_zusatz  | Additional information for address | VARCHAR
str_name    | Street name | VARCHAR
str_nr      | Street number | INT
plz         | Postcode | INT
bez_name    | District name | VARCHAR
bez_nr      | District number | INT
ort_name    | District name | VARCHAR
ort_nr      | District number | VARCHAR
plr_name    | LOR name | VARCHAR
plr_nr      | 1 - 2 = District number 3 - 4 = Forecast room number 5 - 6 =  District region numbr 7 - 8 = Planning area number | INT
blk         | Statistical block number. The first 3 digits correspond to the key of the statistical territory | INT
adr_datum   | Recording date of the address | DATETIME
str_datum   | Recording date of the street | DATETIME
qualitaet   | Quality A = house coordinate in building perimeter (1000) Quality B = house coordinate within parcel (2000) RBS = data set in regional reference system | VARCHAR
typ         | Address type | VARCHAR
