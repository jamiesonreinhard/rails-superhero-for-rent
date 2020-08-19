class AddAddressToSuperheros < ActiveRecord::Migration[6.0]
  def change
    add_column :superheros, :address, :string
  end
end
