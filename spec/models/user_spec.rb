require "rails_helper"

RSpec.describe User, type: :model do
  it "has a first name" do
    user = User.create!(first_name: "Jones", last_name: "Reinhard", email: "jones@reinhard.com", password: "123456")
    expect(user.first_name).to eq("Jones")
  end
end