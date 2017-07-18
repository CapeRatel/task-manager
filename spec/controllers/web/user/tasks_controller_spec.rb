require 'rails_helper'

RSpec.describe Web::User::TasksController, type: :controller do
  let(:user) { create(:user) }
  let!(:task) { create(:task, user: user) }
  let!(:other_task) { create(:task) }

  before do
    sign_in_user(user)
  end

  describe 'GET #index' do
    it 'user see only his tasks' do
      process :index, method: :get
      expect(assigns(:tasks)).to eq(user.tasks)
    end
  end

  describe 'GET #new' do
    it 'assign a new task object' do
      process :new, method: :get
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe 'POST #create' do
    context 'user try create a new task' do
      it 'valid attributes' do
        expect {
          process :create, method: :post, params: { task: attributes_for(:task, user: user) }
        }.to change(Task, :count).by(1)
      end

      it 'invalid attributes' do
        expect {
          process :create, method: :post, params: { task: attributes_for(:task, user: user, name: '') }
        }.to change(Task, :count).by(0)
      end

      it 'render new' do
        process :create, method: :post, params: { task: attributes_for(:task, user: user, name: '') }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    it 'assign exist task' do
      process :edit, method: :get, params: { id: task.id }
      expect(assigns(:task)).to eq(task)
    end
  end

  describe 'PATCH #update' do
    context 'user try update his task' do
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
  end

  describe 'DELETE #destroy' do
    it 'user can delete his task' do
      expect {
        process :destroy, method: :delete, params: { id: task }
      }.to change(Task, :count).by(-1)
    end
  end

  describe 'PATCH #change_state' do
    it 'change to started state' do
      process :change_state, method: :patch, params: { id: task, event: 'start' }
      task.reload
      expect(task.state).to eq('started')
    end

    it 'change to finished state' do
      process :change_state, method: :patch, params: { id: task, event: 'finish' }
      task.reload
      expect(task.state).to eq('finished')
    end

    it 'change to new state' do
      task.finish!
      process :change_state, method: :patch, params: { id: task, event: 'begin' }
      task.reload
      expect(task.state).to eq('new')
    end
  end
end
