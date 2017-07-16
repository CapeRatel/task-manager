class Web::BaseController < ApplicationController
  include WardenHelper
  include Pundit

  helper_method :current_user, :warden
end