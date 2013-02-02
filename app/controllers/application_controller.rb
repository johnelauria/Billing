class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :time_zone

  def time_zone
  	Time.zone = "Beijing"
  end
end
