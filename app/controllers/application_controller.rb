class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :block_foreign_hosts

  def whitelisted?(ip)
    return true if [74.3.135.162].include?(ip)
    false
  end

  def block_foreign_hosts
    return false if whitelisted?(request.remote_ip)
    redirect_to "https://www.google.com" unless request.remote_ip.start_with?("123.456.789")
  end
end
