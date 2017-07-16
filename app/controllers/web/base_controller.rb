class Web::BaseController < ApplicationController
  include WardenHelper
  include Pundit

  after_action :verify_authorized

  helper_method :current_user, :warden
end