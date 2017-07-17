class Web::SessionsController < ::Web::BaseController
  before_action -> { authorize :session }

  def new
    flash[:alert] = warden.message if warden.message.present?
  end

  def create
    warden.authenticate!
    redirect_to user_root_path, notice: t('signed_in')
  end

  def destroy
    warden.logout
    redirect_to root_url, notice: t('have_been_logged_out')
  end
end