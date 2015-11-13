class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :given_tacos, class_name: :Gift, foreign_key: :giver_id
  has_many :received_tacos, class_name: :Gift, foreign_key: :receiver_id


  before_save :extract_username

  validates_presence_of :first_name, :last_name, :email, :phone
  validates :first_name, length: {maximum: 20}
  validates :last_name, length: {maximum: 20}
  validates_length_of :phone, :is => 10
  validates_format_of :phone, with: /\d{10}/, message: "is not in the correct format"

  def reward
    ##what will this return?
  end

  def received_taco?(gift)
    self == gift.receiver
  end

  def unredeemed_gifts
    self.received_tacos.where('redeemed = ?', false)
  end

  def redeemed_gifts
    self.received_tacos.where('redeemed = ?', true)
  end

  def find_associated_coffees
    received_tacos << gift if gift = Gift.find_by(phone: phone)
  end


  private


  def extract_username
    self.email = self.email.split('@').first
  end

end
