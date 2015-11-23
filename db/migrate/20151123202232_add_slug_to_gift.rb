class AddSlugToGift < ActiveRecord::Migration
  def change
    add_column :gifts, :slug, :string
  end
end
