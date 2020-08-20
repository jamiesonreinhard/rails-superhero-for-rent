require 'open-uri'
require 'json'
require 'faker'
require 'pry'

puts "Destroy superheros"
User.destroy_all
Superhero.destroy_all

cities = ['New York City', 'Paris', 'Chicago', 'Mexico City', 'Denver', 'Montreal', 'Berlin', 'Moscow',
          'London', 'Los Angeles', 'Toronto', 'Portland', 'Milan', 'Barcelona', 'Sydney']

valeria = User.create!(first_name: "Valeria", last_name: 'Ramey', email: "valeriaramey@gmail.com", password: "123456")
iben = User.create!(first_name: "Iben", last_name: 'Lewagon', email: "iben@gmail.com", password: "123456")
john = User.create!(first_name: "John", last_name: 'Smith', email: "johnsmith@gmail.com", password: "123456")

puts "Create superheros"

1..50.times do |index|

  random_heros = rand(1..730)
  url = "https://superheroapi.com/api/10101309158912354/#{random_heros}"
  superheros_data = JSON.parse(open(url).read)
  superhero = Superhero.new(name: superheros_data['name'],
    city: cities.sample,
    superpower: Faker::Superhero.power, hourly_price: rand(500...2000), user: User.all.sample)
    if (superheros_data["image"]["url"] != '')
      begin
        file = URI.open(superheros_data["image"]["url"])
        superhero.img_url.attach(io: file, filename: "#{superheros_data['name']}.jpg", content_type: 'image/jpg')
      rescue
         puts "Skip to next"
      end
    end
    superhero.save
end
