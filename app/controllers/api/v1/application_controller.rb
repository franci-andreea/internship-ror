class ApplicationController < ActionController::API
  include ActiveStorage::SetCurrent
  include SessionsHelper
  protect_from_forgery with: :null_session
end
