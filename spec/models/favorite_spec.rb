require "rails_helper"

RSpec.describe Favorite, type: :model do
  let(:user) {
    User.create!(first_name: "Jones", last_name: "Reinhard", email: "jones@reinhard.com", password: "123456")
    
  }
  let(:superhero) {
    Superhero.create!(name: "Spiderman", city: "NYC", superpower: "Spidey Sense", hourly_price: 50, description: "Great superhero", user_id: user.id)
  }
  it "has a superhero_id" do
    favorite = Favorite.create!(superhero_id: superhero.id, user_id: user.id)
    expect(favorite.superhero_id).to eq(1)
  end
end