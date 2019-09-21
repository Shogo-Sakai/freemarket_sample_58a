require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  include SpecTestHelper
  describe 'GET #facebook' do
    it "redirect the :registration path not existing user" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      OmniAuth.config.add_mock(:facebook,{uid: '123545',provider: 'facebook'})
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
      get :facebook
      expect(response).to redirect_to(registration_signup_index_path)
    end

    it "redirect the :root path exist user" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = create(:user,uid: '123545',provider: 'facebook')
      OmniAuth.config.add_mock(:facebook,{uid: '123545',provider: 'facebook'})
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
      get :facebook
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET #google_oauth2' do
    it "redirect the :registration path not existing user" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      OmniAuth.config.add_mock(:google,{uid: '123545',provider: 'google'})
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
      get :google_oauth2
      expect(response).to redirect_to(registration_signup_index_path)
    end

    it "redirect the :root path exist user" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = create(:user,uid: '123545',provider: 'google')
      OmniAuth.config.add_mock(:google,{uid: '123545',provider: 'google'})
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
      get :google_oauth2
      expect(response).to redirect_to(root_path)
    end
  end
end