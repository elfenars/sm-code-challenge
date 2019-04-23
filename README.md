# Coding Challenge

The scope of this challenge is to create an API application. We are mainly interested in code style and structure.

## Specifications
- [x] Use data from this dataset for your application: ​[Link](http://opendata-esri-de.opendata.arcgis.com/datasets/273bf4ae7f6a460fbf3000d73f7b2f76_0
)
- [x] Build a data importer that brings the data into your application
- [x] Build an endpoint that delivers the number of buildings per zip code
- [ ] Build an endpoint that shows the distribution of years in which buildings were added to the dataset (​STR_DATUM​)
- [ ] Make both endpoints filterable by zip codes

## Usage:

* Import data: `rake 'data:import[<path_to_csv>, <batch_size>]'`

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
