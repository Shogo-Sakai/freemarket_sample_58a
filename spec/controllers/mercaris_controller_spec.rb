require 'rails_helper'

describe MercarisController do
  describe 'GET #index' do
    it "populates an array of 10 products ordered by created_at DESC" do
      products = create_list(:product,10)
      get :index
      expect(assigns(:products)).to match(products.sort{ |a, b| b.created_at <=> a.created_at })
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end