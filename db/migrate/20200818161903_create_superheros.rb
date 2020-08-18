class CreateSuperheros < ActiveRecord::Migration[6.0]
  def change
    create_table :superheros do |t|
      t.string :name
      t.string :city
      t.string :superpower
      t.integer :hourly_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
