class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart

  def current_cart
  	if !session[:cart_id].nil?
      Cart.exists?(:id => session[:cart_id]) ? Cart.find(session[:cart_id]) : Cart.new
    else
      Cart.new
  	end
  end

  def current_cart_price
    current_cart.calculate_cart_price
  end

end
