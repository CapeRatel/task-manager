class Web::SessionsController < ::Web::BaseController
  def new
    authorize :session
    flash[:alert] = warden.message if warden.message.present?
  end

  def create
    authorize :session
    warden.authenticate!
    redirect_to root_path, notice: t('signed_in')
  end

  def destroy
    authorize :session
    warden.logout
    redirect_to root_url, notice: t('have_been_logged_out')
  end
end