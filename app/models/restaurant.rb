class Restaurant < ActiveRecord::Base
  has_secure_password
  has_many :menu_items

  validates_presence_of :name, :address, :first_name, :last_name, :email
  t.string :first_name, null:false, limit:20
  t.string :last_name, null:false, limit:20
  validates :email, :name, length: {maximum: 50}
  validates :address, length: {maximum: 150}
  validates_email_format_of :email, message: "Not formatted correctly"
  validates :password, :presence => true, :length => {minimum: 6}, :on => :create
end
