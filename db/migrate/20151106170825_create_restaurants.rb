class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
        t.string :name, null:false, limit:50
        t.string :address, null:false, limit:150
      t.timestamps
    end
  end
end
