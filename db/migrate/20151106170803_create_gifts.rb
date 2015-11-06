class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
        t.references :giver
        t.references :receiver
        t.references :menu_item
        t.boolean :redeemed, default: false
      t.timestamps
    end
  end
end
