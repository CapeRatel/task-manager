require 'rails_helper'

RSpec.describe Web::Admin::TasksController, type: :controller do
  let(:admin) { create(:user, role: 1) }
  let(:tasks) { create_list(:task, 2) }
  let!(:task) { create(:task, user: admin) }

  before do
    sign_in_user(admin)
  end

  describe 'GET #index' do
    it 'assigns all tasks' do
      process :index, method: :get
      expect(assigns(:tasks)).to eq(Task.includes(:user).newest.all)
    end
  end

  describe 'GET #new' do
    it 'assign a new task' do
      process :new, method: :get
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe 'POST #create' do
    it 'valid attributes' do
      expect {
        process :create, method: :post, params: { task: attributes_for(:task, user_id: create(:user)) }
      }.to change(Task, :count).by(1)
    end

    it 'invalid attributes' do
      expect {
        process :create, method: :post, params: { task: attributes_for(:task) }
      }.to change(Task, :count).by(0)
    end

    it 'render new' do
      process :create, method: :post, params: { task: attributes_for(:task, user_id: admin, name: '') }
      expect(response).to render_template(:new)
    end
  end

  describe 'PATCH #update' do
    it 'valid attributes' do
      process :update, method: :patch, params: {
          id: task,
          task: {
              name: 'New Name', description: 'New desc'
          }
      }
      task.reload
      expect(task.name).to eq('New Name')
      expect(task.description).to eq('New desc')
    end

    it 'invalid attributes' do
      process :update, method: :patch, params: {
          id: task, task: { name: '' }
      }
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    it 'admin can delete task' do
      expect {
        process :destroy, method: :delete, params: { id: task }
      }.to change(Task, :count).by(-1)
    end
  end
end
