require 'rails_helper'

describe GiftsController do
  include UserSessionsHelper

  let(:user) { FactoryGirl.create(:user) }
  let(:restaurant) { FactoryGirl.create(:restaurant) }
  let(:gift) { FactoryGirl.build(:gift) }
  let(:menu_item) { FactoryGirl.create(:menu_item) }
  let(:twilio_receiver) { FactoryGirl.create(:twilio_receiver) }
  let(:cc_info) {{"num" => "5105105105105100", "exp_date" => "05/12"}}

  def prepare_gift_show
    @user = FactoryGirl.create(:user)
    log_in_user(@user)
    attrs = FactoryGirl.attributes_for(:gift).merge(receiver: twilio_receiver, menu_item: menu_item, phone: twilio_receiver.phone)
    @gift = @user.received_tacos.create(attrs)
  end

  def gift_attrs
    FactoryGirl.attributes_for(:gift).merge(receiver: twilio_receiver.username, menu_item: menu_item)
  end

  context '#new' do
    it 'renders the new gift form' do
      log_in_user(user)
      get :new, restaurant_id: restaurant
      expect(response).to render_template(:new)
    end

    it 'redirects to root if not logged in' do
      get :new, restaurant_id: restaurant
      expect(response).to redirect_to(root_path)
    end
  end

  context '#create' do
    it 'redirects to root if not logged in' do
     gift_attributes = FactoryGirl.attributes_for(:gift)
      post :create, restaurant_id: restaurant, gift: gift_attributes
      expect(response).to redirect_to(root_path)
    end

    xit 'redirects to new gift if params are invalid' do
      log_in_user(user)
      post :create, restaurant_id: restaurant, gift: {menu_item: "bad data"}
      expect(response).to redirect_to(new_restaurant_gift_path(restaurant))
    end

    xit 'creates a new gift' do
      log_in_user(user)
      menu_item = restaurant.menu_items.create(FactoryGirl.attributes_for(:menu_item))
      attrs = FactoryGirl.attributes_for(:gift).merge(receiver: twilio_receiver.id, menu_item: menu_item)
      expect{post :create, restaurant_id: restaurant, gift: attrs, cc: cc_info }.to change{Gift.all.count}.by(1)
    end

    xit 'redirects to a confirmation page' do
      log_in_user(user)
      menu_item = restaurant.menu_items.create(FactoryGirl.attributes_for(:menu_item))
      attrs = FactoryGirl.attributes_for(:gift).merge(receiver: twilio_receiver.id, menu_item: menu_item)
      post :create, restaurant_id: restaurant, gift: attrs, cc: cc_info
      expect(response).to redirect_to(confirmation_path(Gift.last))
    end
  end

  context '#show' do
    it 'redirects to root if not logged in' do
      attrs = FactoryGirl.attributes_for(:gift).merge(receiver: twilio_receiver, menu_item: menu_item, phone: twilio_receiver.phone)
     gift = user.received_tacos.create(attrs)
      get :show, id: gift
      expect(response).to redirect_to(root_path)
    end

    it 'redirects to root if not authorized to view gift' do
      log_in_user(user)
      user2 = FactoryGirl.create(:user)
      attrs = FactoryGirl.attributes_for(:gift).merge(receiver: twilio_receiver, menu_item: menu_item, phone: twilio_receiver.phone)
     gift = user2.received_tacos.create(attrs)
      get :show, id: gift
      expect(response).to redirect_to(root_path)
    end

    it 'renders the show gift view if  belongs to current user' do
      prepare_gift_show
      get :show, id: @gift
      expect(response).to render_template(:show)
    end

    it 'locates the requested gift' do
      prepare_gift_show
      get :show, id: @gift
      expect(assigns(:gift)).to eq(@gift)
      expect(assigns(:restaurant)).to eq(@gift.restaurant)
    end
  end

  context '#update' do
    xit 'creates new text sender' do
    end
    xit 'redirects to restaurant profile path in success case' do
    end
    xit 'redirects to restaurant profile in error case' do
    end
  end

  context '#confirm' do
    it 'assigns the gifts restaurant to @restaurant' do
      log_in_user(user)
      @menu_item = restaurant.menu_items.create(FactoryGirl.attributes_for(:menu_item))
      @gift = Gift.create(phone:"1234567890", menu_item: @menu_item)
      get :confirm, id: @gift
      expect(assigns(:restaurant)).to be_a(Restaurant)
    end
  end

  context 'transactions' do
    xit 'assigns @processor_response_code in error case' do
    end
    xit 'assigns @processor_response_text in error case' do
    end
    xit 'assigns errors for invalid params' do
    end
  end

end
