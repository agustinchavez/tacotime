class MenuItem < ActiveRecord::Base
  belongs_to :restaurant
  has_many :gifts

  validates_presence_of :name, :price
  validates :name, length: {maximum: 30}
  ## price validation
end
