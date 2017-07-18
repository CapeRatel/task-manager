module AuthenticationMacros
  def sign_in_user(user = nil)
    user = create(:user) if user.nil?
    warden.set_user(user)
  end
end