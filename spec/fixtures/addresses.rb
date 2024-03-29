VALID_ADDRESS = { street: '143 E Main St', city: 'Columbus', zip_code: '43215' }.freeze
INVALID_ADDRESS = { street: '1 Empora St', city: 'Title', zip_code: '11111' }.freeze
ADDRESSES = [
  VALID_ADDRESS,
  INVALID_ADDRESS,
].freeze
VALIDATED_ADDRESSES = [
  {
    original: ADDRESSES[0],
    validated: [
      {
        "input_index" => 0,
        "candidate_index" => 0,
        "delivery_line_1" => "143 E Main St",
        "last_line" => "Columbus OH 43215-5370",
        "delivery_point_barcode" => "432155370992",
        "components" => {
          "primary_number" => "143",
          "street_predirection" => "E",
          "street_name" => "Main",
          "street_suffix" => "St",
          "city_name" => "Columbus",
          "default_city_name" => "Columbus",
          "state_abbreviation" => "OH",
          "zipcode" => "43215",
          "plus4_code" => "5370",
          "delivery_point" => "99",
          "delivery_point_check_digit" => "2"
        },
        "metadata" => {
          "record_type" => "H",
          "zip_type" => "Standard",
          "county_fips" => "39049",
          "county_name" => "Franklin",
          "carrier_route" => "C023",
          "congressional_district" => "03",
          "building_default_indicator" => "Y",
          "rdi" => "Commercial",
          "elot_sequence" => "0232",
          "elot_sort" => "A",
          "latitude" => 39.9567,
          "longitude" => -82.99384,
          "precision" => "Zip9",
          "time_zone" => "Eastern",
          "utc_offset" => -5,
          "dst" => true
        },
        "analysis" => {
          "dpv_match_code" => "D",
          "dpv_footnotes" => "AAN1",
          "dpv_cmra" => "N",
          "dpv_vacant" => "N",
          "dpv_no_stat" => "Y",
          "active" => "Y",
          "footnotes" => "H#"
        }
      }
    ]
  },
  {
    original: ADDRESSES[1],
    validated: []
  }
]

