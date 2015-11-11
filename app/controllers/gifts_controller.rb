class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:show]
  before_filter :authenticate_user!


  # GET /gifts
  # GET /gifts.json
  def index
    @gifts = Gift.all
  end

  # GET /gifts/1
  # GET /gifts/1.json
  def show
    find_gift
    @restaurant = @gift.restaurant
  end

  # GET /gifts/new
  def new
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @menu_items = @restaurant.menu_items
    @gift = Gift.new
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts
  # POST /gifts.json
  def create
    gift = current_user.given_tacos.build(gift_params)
    if gift.save
      text = TwilioTextSender.new(gift)
      text.send!
      redirect_to confirmation_path(gift)
    else
      flash[:error] = gift.errors.full_messages
      redirect_to new_restaurant_gift_path(@restaurant)
    end

  end

  # PATCH/PUT /gifts/1
  # PATCH/PUT /gifts/1.json
  def update
    respond_to do |format|
      if @gift.update(gift_params)
        format.html { redirect_to @gift, notice: 'Gift was successfully updated.' }
        format.json { render :show, status: :ok, location: @gift }
      else
        format.html { render :edit }
        format.json { render json: @gift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gifts/1
  # DELETE /gifts/1.json
  def destroy
    @gift.destroy
    respond_to do |format|
      format.html { redirect_to gifts_url, notice: 'Gift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm
    @gift = Gift.find_by(id: params[:id])
    @restaurant = @gift.restaurant
  end

  private

    def find_gift
      @gift = Gift.find_by(id: params[:id])
    end

    def authorize_user
      find_gift
      redirect_to root_path unless current_user.received_taco?(@gift)
    end

    def authenticate_user
      unless current_user
       flash[:error] = ["Please login to send a meal."]
       redirect_to root_path
      end
    end

    def gift_basic_params
      params.require(:gift).permit(:message)
    end

    def set_gift
      @gift = Gift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gift_params
      receiver = User.find_by(email: params[:gift][:receiver])
      menu_item = MenuItem.find_by(id: params[:gift][:menu_item])
      gift_basic_params.merge(receiver: receiver, menu_item: menu_item)
    end
end
