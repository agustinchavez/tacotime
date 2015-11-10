class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :given_tacos, class_name: :Gift, foreign_key: :giver_id
  has_many :received_tacos, class_name: :Gift, foreign_key: :receiver_id

  before_save :normalize_phone

  validates_presence_of :first_name, :last_name, :email, :phone
  validates :first_name, length: {maximum: 20}
  validates :last_name, length: {maximum: 20}
  validates_format_of :phone, with: /\d{10}/, message: "is not in the correct format"

  def reward
    ##what will this return?
  end

  private

  def normalize_phone
    self.phone = "+1" + phone.to_s
  end

end
