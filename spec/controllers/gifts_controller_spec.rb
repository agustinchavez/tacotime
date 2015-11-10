require 'rails_helper'

describe GiftsController do


  let(:user) { FactoryGirl.create(:user) }
  let(:restaurant) { FactoryGirl.create(:restaurant) }
  let(:gift) { FactoryGirl.create(:gift) }
  let(:menu_item) { FactoryGirl.create(:menu_item) }
  let(:twilio_receiver) { FactoryGirl.create(:twilio_receiver) }

  def gift_attrs
    FactoryGirl.attributes_for(:gift).merge(receiver: twilio_receiver, menu_item: menu_item)
  end

  def gift_post_attrs
    FactoryGirl.attributes_for(:gift).merge(receiver: twilio_receiver.email, menu_item: menu_item)
  end

  context '#new' do
    it 'renders the new  gift form' do
      log_in_user(user)
      get :new, restaurant_id: restaurant
      expect(response).to render_template(:new)
    end

    it 'redirects to root if not logged in' do
      get :new, restaurant_id: cafe
      expect(response).to redirect_to(root_path)
    end
  end

  context '#create' do

    let(:gift_attrs) { FactoryGirl.attributes_for(:gift)}

    it 'redirects to root if not logged in' do
      post :create, restaurant_id: restaurant, gift: gift_attrs
      expect(response).to redirect_to(root_path)
    end

    it 'creates a new gift' do
    end

    it 'notifies the receiver of the gift' do
    end

    it 'redirects to a confirmation page' do
    end

    it 'does not create a gift with invalid attributes' do
    end
  end

  context '#show' do

    it 'redirects to root if not logged in' do
      get :show, id: gift
      expect(response).to redirect_to(root_path)
    end

    it 'redirects to root if not authorized to view gift' do
      current_user = FactoryGirl.create(:user)
      log_in_user(current_user)
      gift.update_attributes(gift_attrs)
      # binding.pry
      get :show, id: gift
      expect(response).to redirect_to(root_path)
    end

  end

end
