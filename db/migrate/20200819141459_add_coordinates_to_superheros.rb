class AddCoordinatesToSuperheros < ActiveRecord::Migration[6.0]
  def change
    add_column :superheros, :latitude, :float
    add_column :superheros, :longitude, :float
  end
end
