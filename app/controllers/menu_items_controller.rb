class MenuItemsController < ApplicationController
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]
  before_action :find_menu_item, :authenticate_restaurant
  before_action :authorize_restaurant, {except: :create}

 def create
    restaurant = current_restaurant
    menu_item = restaurant.menu_items.build(menu_item_params)
    menu_item.save
    redirect_to restaurants_profile_path
  end

  def update
    @restaurant = @menu_item.restaurant
    @menu_item.update_attributes(menu_item_params)
    redirect_to restaurants_profile_path
  end

  def destroy
    @restaurant = @menu_item.restaurant
    @menu_item.destroy
    redirect_to restaurants_profile_path
  end

 private

  def menu_item_params
    params.require(:menu_item).permit(:name, :price)
  end

  def find_menu_item
    @menu_item = MenuItem.find_by_slug(params[:id])
  end

  def authenticate_restaurant
    redirect_to root_path unless current_restaurant
  end

  def authorize_restaurant
    redirect_to root_path unless current_restaurant.owns_item?(@menu_item)
  end

end
