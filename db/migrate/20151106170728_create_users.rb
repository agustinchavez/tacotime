class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        t.string :first_name, null:false, limit:20
        t.string :last_name, null:false, limit:20
        t.string :phone, null:false
      t.timestamps
    end
  end
end
