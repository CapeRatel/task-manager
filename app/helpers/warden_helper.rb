module WardenHelper
  def current_user
    @current_user ||= warden.try(:user)
  end

  def warden
    request.env['warden']
  end
end
