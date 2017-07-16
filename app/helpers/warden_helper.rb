module WardenHelper
  def current_user
    @current_user ||= warden.try(:user)
  end

  def warden
    env['warden']
  end
end
