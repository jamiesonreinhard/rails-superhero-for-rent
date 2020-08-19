class RemoveAddressFromSuperheros < ActiveRecord::Migration[6.0]
  def change
    remove_column :superheros, :address
  end
end
