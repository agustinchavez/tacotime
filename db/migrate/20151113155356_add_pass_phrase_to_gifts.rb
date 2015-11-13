class AddPassPhraseToGifts < ActiveRecord::Migration
  def change
    add_column :gifts, :passphrase, :string
  end
end
