class Gift < ActiveRecord::Base

  belongs_to :menu_item
  belongs_to :receiver, class_name: :User
  belongs_to :giver, class_name: :User

  delegate :name, to: :menu_item
  delegate :restaurant, to: :menu_item
  delegate :price, to: :menu_item

  before_save :generate_slug, :generate_redemption_code

  validates_presence_of :menu_item
  validates_presence_of :phone, unless: Proc.new { |gift| gift.charitable }

  def assign_phone(params)
    self.menu_item = MenuItem.find_by(id: params[:menu_item])
    self.receiver = User.find_by(id: params[:receiver]) || User.find_by(phone: params[:phone])
    self.phone = self.receiver.phone if self.phone.blank? && self.receiver
  end

  def to_param
    "#{self.id}-#{slug}"
  end

  private

  def generate_redemption_code
    self.redemption_code = rand(36**8).to_s(36)
  end

  def generate_slug
    self.slug = self.name.parameterize
  end


end
