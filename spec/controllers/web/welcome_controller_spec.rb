require 'rails_helper'

RSpec.describe Web::WelcomeController, type: :controller do
  let!(:tasks) { create_list(:task, 2) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(assigns(:tasks)).to eq(Task.order(created_at: :desc).all)
    end
  end
end
