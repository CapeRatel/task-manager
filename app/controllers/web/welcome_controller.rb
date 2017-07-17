class Web::WelcomeController < ::Web::BaseController
  skip_after_action :verify_authorized

  def index
    @tasks = Task.includes(:user).newest.all
  end
end
