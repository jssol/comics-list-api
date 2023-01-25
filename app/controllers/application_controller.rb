require_relative 'url_helper_methods'

class ApplicationController < ActionController::API
  include UrlHelperMethods
end
