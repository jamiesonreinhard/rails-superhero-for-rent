class DeleteImageUrlFromSuperheros < ActiveRecord::Migration[6.0]
  def change
    remove_column :superheros, :img_url
  end
end
