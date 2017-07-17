class Web::Admin::TasksController < ::Web::Admin::BaseController
  before_action -> { authorize [:admin, :task] }, only: [:index, :new, :create]
  before_action :load_users_list, only: [:new, :create, :edit, :update]
  before_action :load_and_authorize_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.includes(:user).newest.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to [:admin, @task], notice: t('task_created')
    else
      render :new
    end
  end

  def edit;end

  def update
    if @task.update(task_params)
      redirect_to [:admin, @task], notice: t('task_updated')
    else
      render :edit
    end
  end

  def destroy
    @task.destroy and (redirect_to admin_root_path, notice: t('task_destroyed'))
  end

  private

  def load_and_authorize_task
    @task = Task.find(params[:id])
    authorize [:admin, @task]
  end

  def load_users_list
    @users_list = User.all
  end

  def task_params
    params.require(:task).permit(:name, :description, :state, :user_id, :attachment)
  end
end
