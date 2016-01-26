require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  let(:restaurant) { FactoryGirl.create(:restaurant) }
  let(:menu_item) {FactoryGirl.create(:menu_item)}

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(50) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_length_of(:address).is_at_most(150) }
    it { should validate_length_of(:password).is_at_least(6).on(:create) }
    it { expect(FactoryGirl.build(:restaurant)).to validate_uniqueness_of(:email) }
  end

  context 'associations' do
    it 'should have many menu items' do
      should have_many :menu_items
    end

    it 'should have many gifts' do
      should have_many :gifts
    end
  end

  describe '#owns_item?' do
    it 'should return true for a menu belonging to a particular restaurant' do
      item = restaurant.menu_items.create(FactoryGirl.attributes_for(:menu_item))
      expect(restaurant.owns_item?(item)).to be_truthy
    end
  end

  describe '#owner?' do
    it 'should return true if current restaurant is logged in' do
      expect(restaurant.owner?(restaurant)).to be_truthy
    end
  end


  describe '#redeemed_gifts' do
    xit 'should return a list of all redeemed gifts' do
      restaurant = FactoryGirl.create(:restaurant)
      menu_item = restaurant.menu_items.create(FactoryGirl.attributes_for(:menu_item))
      redeemed_gifts = (1..5).to_a.map {menu_item.gifts.create(menu_item: menu_item, charitable: true, redeemed: true)}
      expect(restaurant.redeemed_gifts.to_a).to eq(redeemed_gifts)
    end
  end

  describe '#to_param' do
    it 'should generate the correct slug' do
      restaurant = FactoryGirl.create(:restaurant)
      restaurant.update_attributes(name: "Example restaurant")
      expect(restaurant.slug).to eq("example-restaurant")
    end
  end

end