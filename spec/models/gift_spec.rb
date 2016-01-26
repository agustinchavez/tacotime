require 'rails_helper'

describe Gift do

  context 'associations' do

    it 'should belong to menu items' do
      should belong_to :menu_item
    end

    it 'should belong to receiver' do
      should belong_to :receiver
    end

    it 'should belong to giver' do
      should belong_to :giver
    end
  end

  context 'contains valid data' do
    it { expect(subject).to validate_presence_of(:menu_item) }
    it { expect(subject).to validate_presence_of(:phone) }
  end

  context 'phone validation does not run for charitable gift' do
    gift = FactoryGirl.build(:gift)
    gift.update_attributes(charitable: true, menu_item: FactoryGirl.create(:menu_item))
    gift.save
    it { expect(gift).to be_valid }
  end

  context 'delegation' do
    it 'should delegate name to menu items' do
      should delegate_method(:name).to(:menu_item)
    end

    it 'should delegate restaurant to menu items' do
      should delegate_method(:restaurant).to(:menu_item)
    end

    it 'should delegate price to menu item' do
      should delegate_method(:price).to(:menu_item)
    end
  end

  describe '#assign_phone' do
    menu_item = FactoryGirl.create(:menu_item)
    receiver = FactoryGirl.create(:user)
    gift = FactoryGirl.build(:gift)
    gift.update_attributes(menu_item: menu_item, receiver: receiver)
    gift.assign_phone(menu_item: menu_item.id, receiver: receiver.id)

    it 'should assign the phone num of the receiver' do
      expect(gift.phone).to eq(receiver.phone.to_s)
    end
  end

end