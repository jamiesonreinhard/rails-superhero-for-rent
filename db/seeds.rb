require 'open-uri'
require 'json'
require 'faker'

# puts "Destroy superheros"
# Superhero.destroy_all if Rails.env.development?


puts "Create superheroes"

1..100.times do |index|

  url = "https://superheroapi.com/api/10101309158912354/#{index+1}"
  superheros_data = JSON.parse(open(url).read)
  supehero = Superhero.new(name: superheros_data['name'], image_url: superheros_data["image"]["url"],
    city: Faker::Address.city,
    superpower: Faker::Superhero.power, hourly_price: rand(500...2000), user: User.all.sample)
    file = URI.open(superheros_data["image"]["url"])
    supehero.photo.attach(io: file, filename: "#{supeheros_data['name']}.jpeg", content_type: 'image/jpeg')
    superhero.save
end



