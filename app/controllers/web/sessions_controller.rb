class Web::SessionsController < ::Web::BaseController
  before_action -> { authorize :session }

  def new
    flash[:alert] = warden.message if warden.message.present?
  end

  def create
    warden.authenticate!
    flash[:notice] = t('signed_in')
    redirect_to(current_user.admin? ? admin_root_path : user_root_path)
  end

  def destroy
    warden.logout
    redirect_to root_url, notice: t('have_been_logged_out')
  end
end