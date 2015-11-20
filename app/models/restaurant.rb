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

  validates_uniqueness_of :email

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

  def self.filter_by_city(tag)
      self.all.where(city: tag)
  end

  def self.filter_by_neighborhood(tag)
    self.all.where(neighborhood: tag)
  end

  def charitable_gifts
    gifts.where(charitable: true)
  end

  def search(search)
    self.unredeemed_gifts.where("redemption_code LIKE ?", "%#{search}%")
  end

end
