class RestaurantsController < ApplicationController

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurant = Restaurant.all
    if request.xhr?
      render @restaurants
    else
      render :index
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    @restaurant = current_restaurant unless @restaurant
    @menu_item = MenuItem.new
    @menu_items = @restaurant.menu_items
    @yelp = Yelp.client.search(@restaurant.address.gsub!("\n",' '), {term: @restaurant.name})
      @yelp_image = @yelp.businesses.first.image_url.chomp('ms.jpg')+"o.jpg"
      @yelp_rating = @yelp.businesses.first.rating_img_url_large
      @yelp_review_count = @yelp.businesses.first.review_count
      begin
      @yelp_phone = @yelp.businesses.first.display_phone
      rescue
        @yelp_phone = "not found"
      end
      @yelp_link = @yelp.businesses.first.url
    if params[:search]
      @unredeemed_gifts = @restaurant.search(params[:search]).order("created_at DESC")
    else
      @unredeemed_gifts = @restaurant.unredeemed_gifts
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
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    @restaurant = current_restaurant
    if params[:restaurant]
      @restaurant.update_attributes(params[:restaurant])
    else
      flash[:error] = ["Something Went Wrong!"]
    end
    render :show
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Restaurant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

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

    # # Use callbacks to share common setup or constraints between actions.
    # def set_restaurant
    #   @restaurant = Restaurant.find(params[:id])
    # end

    # # Never trust parameters from the scary internet, only allow the white list through.
    # def restaurant_params
    #   params[:restaurant]
    # end
end
