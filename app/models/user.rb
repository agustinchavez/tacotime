class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :gifts, foreign_key: :giver_id
  has_many :gifts, foreign_key: :receiver_id

  validates_presence_of :first_name, :last_name, :email, :phone
  validates :first_name, length: {maximum: 20}
  validates :last_name, length: {maximum: 20}
  ##write validation for phone number

  def reward
    ##what will this return?
  end
end
