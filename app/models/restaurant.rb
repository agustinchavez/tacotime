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

  before_save :generate_slug


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

  def unredeemed_charitable_gifts
    gifts.where(charitable: true, redeemed: false)
  end

  def search_non_charitable_gifts(search)
    self.unredeemed_gifts.where("redemption_code LIKE ? AND charitable = ?", "%#{search}%", false)
  end

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = self.name.parameterize
  end

end
