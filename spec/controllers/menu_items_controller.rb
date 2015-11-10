require 'rails_helper'

RSpec.describe MenuItemsController, type: :controller do

  def new_menu_item
    @restaurant = FactoryGirl.create(:restaurant)
    log_in_restaurant(@restaurant)
    @menu_item = @restaurant.menu_items.new
  end

  def menu_item_attrs
    FactoryGirl.attributes_for(:menu_item)
  end

  def invalid_menu_item_attrs
    FactoryGirl.attributes_for(:invalid_menu_item)
  end

  def create_menu_item
    new_menu_item
    @menu_item.update_attributes(menu_item_attrs)
  end

  describe 'POST #create' do
    it 'adds a menu item to a restaurants menu' do
      new_menu_item
      expect{post :create, restaurant_id: @restaurant.id, menu_item: menu_item_attrs }.to change{@restaurant.menu_items.count}.by(1)
    end
    it 'does not add an invalid menu item' do
      new_menu_item
      expect{post :create, restaurant_id: @restaurant.id, menu_item: invalid_menu_item_attrs }.to change{@restaurant.menu_items.count}.by(0)
    end
    it 'redirects to restaurant#show after attempting to add' do
      new_menu_item
      post :create, restaurant_id: @restaurant.id, menu_item: menu_item_attrs
      expect(response).to redirect_to(restaurant_path(@restaurant))
    end

    it 'does not allow creation when logged out' do
      @restaurant = FactoryGirl.create(:restaurant)
      @menu_item = @restaurant.menu_items.new
      expect {
        post :create, restaurant_id: @restaurant, menu_item: menu_item_attrs
      }.to change(Restaurant, :count).by(0)
    end
  end

  describe 'PUT #update' do
    it 'updates the attributes of a menu item' do
      create_menu_item
      new_attrs = menu_item_attrs
      put :update, restaurant_id: @restaurant.id, id: @menu_item.id, menu_item: new_attrs
      @menu_item.reload
      attrs = {name: @menu_item.name, price: @menu_item.price}
      expect(attrs).to eq(new_attrs)
    end
    it 'does not update menu item with invalid params' do
      create_menu_item
      old_attrs = @menu_item.attributes
      new_attrs = invalid_menu_item_attrs
      put :update, restaurant_id: @restaurant.id, id: @menu_item.id, menu_item: new_attrs
      expect(@menu_item.attributes).to eq(old_attrs)
    end
    it 'redirects to restaurant#show after attempting to update' do
      create_menu_item
      put :update, restaurant_id: @restaurant.id, id: @menu_item.id, menu_item: menu_item_attrs
      expect(response).to redirect_to(restaurant_path(@restaurant))
    end
    it 'does not allow edits when logged out' do # this test needs refactoring
      @restaurant = FactoryGirl.create(:restaurant)
      @menu_item = @restaurant.menu_items.new
      @menu_item.update_attributes(menu_item_attrs)
      old_attrs = @menu_item.attributes
      new_attrs = menu_item_attrs
      put :update, restaurant_id: @restaurant.id, id: @menu_item.id, menu_item: new_attrs
      @menu_item.reload
      attrs = {name: @menu_item.name, price: @menu_item.price}
      expect(@menu_item.attributes).to eq(old_attrs)
    end
    it 'does not allow edits when unauthorized' do
      @restaurant1 = FactoryGirl.create(:restaurant)
      @restaurant2 = FactoryGirl.create(:restaurant)
      log_in_restaurant(@restaurant1)
      @menu_item = @restaurant2.menu_items.new
      @menu_item.update_attributes(menu_item_attrs)
      old_attrs = @menu_item.attributes
      new_attrs = menu_item_attrs
      put :update, restaurant_id: @restaurant2.id , id: @menu_item.id, menu_item: new_attrs
      @menu_item.reload
      attrs = {name: @menu_item.name, price: @menu_item.price}
      expect(@menu_item.attributes).to eq(old_attrs)
    end
  end

  describe 'DELETE #destroy' do
    it 'reduces menu item count by 1' do
      create_menu_item
      expect{delete :destroy, restaurant_id: @restaurant.id, id: @menu_item.id}.to change{@restaurant.menu_items.count}.by(-1)
    end
    it 'redirects to restaurant#show after destruction' do
      create_menu_item
      delete :destroy, restaurant_id: @restaurant.id, id: @menu_item.id
      expect(response).to redirect_to(restaurant_path(@restaurant))
    end
    it 'does not allow destruction when logged out' do
      @restaurant = FactoryGirl.create(:restaurant)
      @menu_item = @restaurant.menu_items.new
      @menu_item.update_attributes(menu_item_attrs)
      expect{delete :destroy, restaurant_id: @restaurant.id, id: @menu_item.id}.to change{@restaurant.menu_items.count}.by(0)
    end
    it 'does not allow destruction when unauthorized' do
      @restaurant1 = FactoryGirl.create(:restaurant)
      @restaurant2 = FactoryGirl.create(:restaurant)
      log_in_restaurant(@restaurant1)
      @menu_item = @restaurant2.menu_items.new
      @menu_item.update_attributes(menu_item_attrs)
      expect{delete :destroy, restaurant_id: @restaurant2.id, id: @menu_item.id}.to change{@restaurant1.menu_items.count}.by(0)
    end
  end
end