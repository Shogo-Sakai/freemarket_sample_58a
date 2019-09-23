require "rails_helper"

describe ProductsController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    it "renders the :show template" do
      get :show, params:{id:1}
    end
  end

  describe 'POST #create' do
    it 'redirect to error page if error' do
      user = create(:user)
      sign_in(user)
      post :create, params:{ product:{title:"test product", text:"test text", category_index_id: 1, fresh_status:"新品、未使用", deliver_way:"ゆうパック", deliver_person:"送料込み(出品者負担)", from_area:"三重県", deliver_leadtime:"3-4日で発送", price:"3000"}, product_image: attributes_for(:product_image, {image:["test.jpeg", "test2.jpeg"]})}
      expect(response).to redirect_to("http://test.host/")
    end
  end

  describe 'POST #create' do
    it 'redirect to root page if created' do
      user = create(:user)
      sign_in(user)
      post :create, params:{ product:{title:"test product", text:"test text", category_index_id: 1, fresh_status:"新品、未使用", deliver_way:"ゆうパック", deliver_person:"送料込み(出品者負担)", from_area:"三重県", deliver_leadtime:"3-4日で発送", price:"3000"}, product_image: {image:["test.jpeg", "test2.jpeg"]}}
      expect(response).to redirect_to(root_path)
    end
  end

end
