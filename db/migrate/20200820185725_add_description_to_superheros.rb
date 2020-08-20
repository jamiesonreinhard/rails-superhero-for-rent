class AddDescriptionToSuperheros < ActiveRecord::Migration[6.0]
  def change
    add_column :superheros, :description, :string
  end
end
