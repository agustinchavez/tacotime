class RestaurantsController < ApplicationController

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
    if request.xhr?
      render @restaurants
    else
      render :index
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find_by(slug: params[:id])
    @restaurant = current_restaurant unless @restaurant
    @menu_item = MenuItem.new
    @menu_items = @restaurant.menu_items
    @charitable_gifts = @restaurant.unredeemed_charitable_gifts
    @unredeemed_gifts = @restaurant.unredeemed_gifts
    if request.xhr?
      if params[:search] == ""
        @unredeemed_gifts = []
      else
        @unredeemed_gifts = @restaurant.search_non_charitable_gifts(params[:search]).order("created_at DESC")
      end
      render partial: "unredeemed_gift", collection: @unredeemed_gifts
    end
  end



  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    restaurant = Restaurant.new(user_params)
    if restaurant.save
      log_in_restaurant(restaurant)
      restaurant.find_associated_tacos
      redirect_to root_path
    else
      flash[:reg_error]=restaurant.errors.full_messages
      redirect_to root_path
    end
  end

 def update
  @restaurant = current_restaurant
  if params[:restaurant]
    @restaurant.update_attributes(params[:restaurant])
  else
    flash[:error] = ["Something Went Wrong! Your Picture Was Not Uploaded"]
  end
  render :show
end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  # def destroy
  #   @restaurant.destroy
  #   respond_to do |format|
  #     format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def city
    if request.xhr?
      @restaurants = Restaurant.filter_by_city(params[:tag])
      render @restaurants
    else
      @restaurants = Restaurant.all
      render :index
    end
  end

  def neighborhood
    if request.xhr?
      @restaurants = Restaurant.filter_by_neighborhood(params[:tag])
      render @restaurants
    else
      @restaurants = Restaurant.all
      render :index
    end
  end

end




