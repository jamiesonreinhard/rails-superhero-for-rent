class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :number_of_hours
      t.date :date
      t.string :location
      t.string :event
      t.references :user, null: false, foreign_key: true
      t.references :superhero, null: false, foreign_key: true

      t.timestamps
    end
  end
end
