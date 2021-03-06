class GiftsController < ApplicationController

  before_action :authenticate_user, except: [:update, :filter, :redemption_confirmation]
  before_action :find_gift, except: [:new, :create, :filter]
  before_action :authorize_user, only: [:show]

  # GET /gifts
  # GET /gifts.json
  def index
    @gifts = Gift.all
  end

  def redemption_confirmation
    @restaurant = @gift.restaurant
  end

  # GET /gifts/1
  # GET /gifts/1.json
  def show
    find_gift
    @restaurant = @gift.restaurant
  end

  # GET /gifts/new
  def new
    if request.xhr?
      flash[:auth_error] = "Please login to send coffee." unless current_user
      @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    else
      @restaurant = Restaurant.find_by(slug: params[:restaurant_id])
    end
    @menu_items = @restaurant.menu_items
    @receivers = User.all
    @gift = Gift.new
    render :new, layout: !request.xhr?
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts
  # POST /gifts.json
  def create
    restaurant = Restaurant.find_by(slug: params[:restaurant_id])
    gift = current_user.given_tacos.build(gift_params)
    gift.assign_phone(params[:gift])
    if gift.save
      session[:tmp_id] = nil
      session[:tmp_id] = gift.id
      session[:tmp_price] = gift.price
      redirect_to new_transaction_path
    else
      gift.destroy
      flash[:error] = gift.errors.full_messages
      redirect_to restaurant_path(restaurant)
    end

  end

  # PATCH/PUT /gifts/1
  # PATCH/PUT /gifts/1.json
  def update
    find_gift
    if @gift.update_attributes(redeemed: true)
      flash[:notice] = "Meal Redeemed!"
      TwilioTextSender.send!(@gift)
      redirect_to redemption_confirmation_path
    else
      flash[:error] = "Unable to redeem voucher"
      redirect_to restaurants_profile_path
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

  def confirm_redemption
    @restaurant = @gift.restaurant
  end

  def confirm
    @gift = Gift.find_by(id: params[:id])
    @restaurant = @gift.restaurant
  end

  private

  def find_gift
    @gift = Gift.find_by(id: params[:id].split("-").first)
  end

  # def authorize_user
  #   find_gift
  #   redirect_to root_path unless current_user.received_taco?(@gift)
  # end

  def authenticate_user
    unless current_user || request.xhr?
     flash[:error] = ["Please login to send a meal."]
     redirect_to root_path
    end
  end

  def gift_params
    params.require(:gift).permit(:message, :phone, :charitable)
  end

  def set_gift
    @gift = Gift.find(params[:id])
  end

end
