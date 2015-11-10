class AddMessageToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :message, :text
  end
end
