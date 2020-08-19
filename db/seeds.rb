require 'open-uri'
require 'json'
require 'faker'

puts "Destroy superheros"
User.destroy_all
Superhero.destroy_all



cities = ['Avon', 'Branford', 'Bristol', 'East Meadow', 'East Syracuse', 'Evans Mills', 'Farmingdale', 'Fishskill',
          'Gardner', 'Hadley', 'Halifax', 'Hanover', 'Hudson', 'Leicester', 'Leominster', 'Lunenburg', 'Norwich',
          'Old Saybrook', 'Putnam', 'Rocky Hill'
         ]

addresses = ["255 W Main St, Avon CT 6001",
  "120 Commercial Parkway, Branford CT 6405",
  "1400 Farmington Ave, Bristol CT 6010",
  "2465 Hempstead Turnpike, East Meadow NY 11554",
  "6438 Basile Rowe, East Syracuse NY 13057",
  "25737 US Rt 11, Evans Mills NY 13637",
  "901 Route 110, Farmingdale NY 11735",
  "2400 Route 9, Fishkill NY 12524",
   "677 Timpany Blvd, Gardner MA 1440",
  "337 Russell St, Hadley MA 1035",
  "295 Plymouth Street, Halifax MA 2338",
  "1775 Washington St, Hanover MA 2339",
  "280 Washington Street, Hudson MA 1749",
  "20 Soojian Dr, Leicester MA 1524",
  "11 Jungle Road, Leominster MA 1453",
  "301 Massachusetts Ave, Lunenburg MA 1462",
   "220 Salem Turnpike, Norwich CT 6360",
  "655 Boston Post Rd, Old Saybrook CT 6475",
  "625 School Street, Putnam CT 6260",
  "80 Town Line Rd, Rocky Hill CT 6067"]


puts "Create superheroes"

1..100.times do |index|

  url = "https://superheroapi.com/api/10101309158912354/#{index+1}"
  superheros_data = JSON.parse(open(url).read)
  superhero = Superhero.new(name: superheros_data['name'],
    city: cities.sample, address: addresses.sample, img_url: superheros_data["image"]["url"],
    superpower: Faker::Superhero.power, hourly_price: rand(500...2000), user: User.all.sample)
    file = URI.open(superheros_data["image"]["url"])
    superhero.photo.attach(io: file, filename: "#{superheros_data['name']}.jpeg", content_type: 'image/jpeg')
    superhero.save
end




