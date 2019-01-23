# Create the BH3 Marathon 2016 event unless it exists
if !SpecialEvent.find_by(name: "Boston H3 Marathon 2016: Dungeons and Drag Queens")
  SpecialEvent.create(
    name: "Boston H3 Marathon 2016: Dungeons and Drag Queens",
    date: Date.parse("2016-04-16"),
    url_code: "marathon_2016",
    tiered_rego_prices: [69, 79],
    tiered_rego_dates: [Date.parse("2016-02-09"), Date.parse("2016-03-31")],
    full_rego_price: 89,
    extra_hab_type: "Shirt",
    extra_hab_price: 15
  )
end

# Create the BH3 Marathon 2017 event unless it exists
if !SpecialEvent.find_by(name: "Boston H3 Marathon 2017")
  SpecialEvent.create(
    name: "Boston H3 Marathon 2017",
    date: Date.parse("2017-04-15"),
    url_code: "marathon_2017",
    tiered_rego_prices: [69, 79],
    tiered_rego_dates: [Date.parse("2017-02-09"), Date.parse("2017-03-31")],
    full_rego_price: 89,
    extra_hab_type: nil,
    extra_hab_price: nil
  )
end

# Create the BH3 Marathon 2018 event unless it exists
if !SpecialEvent.find_by(name: "Boston H3 Marathon 2018: Hashy Potter and the Wicked Magical Marathon")
  SpecialEvent.create(
    name: "Boston H3 Marathon 2018: Hashy Potter and the Wicked Magical Marathon",
    date: Date.parse("2018-04-14"),
    url_code: "marathon_2018",
    tiered_rego_prices: [69, 79],
    tiered_rego_dates: [Date.parse("2018-02-09"), Date.parse("2018-03-31")],
    full_rego_price: 89,
    extra_hab_type: nil,
    extra_hab_price: nil
  )
end

# Create the BH3 Marathon 2019 event unless it exists
if !SpecialEvent.find_by(name: "Boston H3 Marathon 2019 - Game of Boners: A Song of Fireball and Smirnoff Ice")
  SpecialEvent.create(
    name: "Boston H3 Marathon 2019 - Game of Boners: A Song of Fireball and Smirnoff Ice",
    date: Date.parse("2018-04-13"),
    url_code: "marathon_2019",
    tiered_rego_prices: [69, 79],
    tiered_rego_dates: [Date.parse("2018-02-08"), Date.parse("2018-03-31")],
    full_rego_price: 89,
    extra_hab_type: nil,
    extra_hab_price: nil
  )
end
