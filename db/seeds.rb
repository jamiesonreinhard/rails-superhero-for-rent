require 'open-uri'
require 'json'

superhero_data = JSON.parse(open("https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/all.json").read)

puts superhero_data[0]["name"]

100.times do
  random_index = rand(1..700)
  superindex = superhero_data[random_index]
  Superhero.create!(name: superindex["name"], city: superindex["work"]["base"] != "-" ? superindex["work"]["base"] : (['New York', 'Los Angeles', 'Houston', 'Chicago', 'Seattle']).sample, superpower: "Butt Kicking", hourly_price: rand(50..1000))
end