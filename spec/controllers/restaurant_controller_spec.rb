require 'rails_helper'

describe RestaurantsController do

  let!(:restaurant) {FactoryGirl.create(:restaurant)}

  describe 'GET #index' do

    context 'cafe index page' do

      before :each do
        get :index
      end

      it 'assigns all restaurants to @restaurants' do
      expect(assigns(:restaurants)).to match(Restaurant.all)
      end

      it 'renders the correct page' do
        expect(response).to render_template :index
      end

    end

  end

  describe 'GET #show' do

    context 'shows a particular restaurant' do

      before :each do
        get :show, id: restaurant.id
      end

      it 'assigns the correct restaurant to @restaurant' do
        expect(assigns(:restaurant)).to eq(restaurant)
      end

      it 'renders the correct page' do
        expect(response).to render_template('show')
      end

    end

  end

end