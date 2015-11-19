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

  mount_uploader :picture, PictureUploader

  def owns_item?(menu_item)
    self == menu_item.restaurant
  end

  def owner?(current_restaurant)
    self == current_restaurant
  end

  def unredeemed_gifts
   self.gifts.where('redeemed = ?', false)
 end

 def redeemed_gifts
   self.gifts.where('redeemed = ?', true)
 end

  def filter_by_city
      Restaurant.all.where(city: self.city)
  end

  def filter_by_neighborhood
    Restaurant.all.where(neighborhood: self.neighborhood)
  end




end
