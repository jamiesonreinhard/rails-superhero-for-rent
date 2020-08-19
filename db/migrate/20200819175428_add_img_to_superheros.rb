class AddImgToSuperheros < ActiveRecord::Migration[6.0]
  def change
    add_column :superheros, :img_url, :string
  end
end
