class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent
  include SessionsHelper
  protect_from_forgery with: :null_session
end
