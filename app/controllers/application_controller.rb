class ApplicationController < ActionController::Base
  # prevent csrf attacks by raising an exception.
  # for apis, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
		