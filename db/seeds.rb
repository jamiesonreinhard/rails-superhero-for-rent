require 'open-uri'
require 'json'
require 'faker'

puts "Destroy superheros"
User.destroy_all
Superhero.destroy_all



cities = ['New York City', 'Paris', 'Chicago', 'Mexico City', 'Denver', 'Montreal', 'Berlin', 'Moscow',
          'London', 'Los Angeles', 'Toronto', 'Portland', 'Milan', 'Barcelona', 'Sydney']
         ]


puts "Create superheroes"

1..100.times do |index|

  url = "https://superheroapi.com/api/10101309158912354/#{index+1}"
  superheros_data = JSON.parse(open(url).read)
  superhero = Superhero.new(name: superheros_data['name'],
    city: cities.sample, address: addresses.sample, img_url: superheros_data["image"]["url"],
    superpower: Faker::Superhero.power, hourly_price: rand(500...2000), user: User.all.sample)
    if (superheros_data["image"]["url"])
      file = URI.open(superheros_data["image"]["url"])
      superhero.img_url.attach(io: file, filename: "#{superheros_data['name']}.jpeg", content_type: 'image/jpeg')
    end
    superhero.save
end




