class Restaurant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :menu_items
  has_many :gifts, through: :menu_items

  validates_presence_of :name, :address, :email
  validates :name, length: {maximum: 50}

  validates :address, length: {maximum: 150}

  def owns_item?(menu_item)
    self == menu_item.cafe
  end

end
