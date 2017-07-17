class Web::User::TasksController < ::Web::User::BaseController
  include TaskStateable

  before_action -> { authorize [:user, :task] }, only: [:index, :new, :create]
  before_action :load_and_authorize_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
  end

  def show;end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to [:user, @task], notice: t('task_created')
    else
      render :new
    end
  end

  def edit;end

  def update
    if @task.update(task_params)
      redirect_to [:user, @task], notice: t('task_updated')
    else
      render :edit
    end
  end

  def destroy
    @task.destroy and (redirect_to user_root_path, notice: t('task_destroyed'))
  end

  private

  def load_and_authorize_task
    @task = current_user.tasks.find(params[:id])
    authorize [:user, @task]
  end

  def task_params
    params.require(:task).permit(:name, :description, :attachment, :attachment_cache)
  end
end
