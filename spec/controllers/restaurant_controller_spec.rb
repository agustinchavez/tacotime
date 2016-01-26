require 'rails_helper'

describe RestaurantsController do

  let!(:restaurant) {FactoryGirl.create(:restaurant)}

  describe 'GET #index' do
    context 'restaurant index page' do

      before :each do
        get :index
      end

      it 'assigns all restaurants to @restaurants' do
        expect(assigns(:restaurants)).to eq(Restaurant.all)
      end

      it 'renders the correct page' do
        expect(response).to render_template :index
      end
    end
  end

  describe 'GET #show' do
    context 'shows a particular restaurant' do
      pending
    end
  end

  describe 'GET #city' do
    pending
  end

  describe 'GET #neighborhood' do
    pending
  end
end