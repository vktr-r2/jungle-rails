class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end
  

  private
  
   
  def cart
    # if @cart is 'nil' > check if there are cookies for the cart present.  If yes, parse cookies and assign to @cart, otherwise assign empty hash to @cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  #Declare cart controller method to be a helper so it is available in the view
  helper_method :cart

  def enhanced_cart
    # The ||= operator will only assign a value to @enhanced_cart if it is currently nil.
    @enhanced_cart ||= 
      # Fetch Products from the database where their id is in the list of keys in the cart.
      # This gives us a list of product objects that the user has in their cart.
      Product.where(id: cart.keys)
      # For each of these product objects, we are going to create a new hash.
      # This hash will have two keys: :product and :quantity.
      .map do |product| 
        { 
          # :product will point to the product object itself.
          product: product, 
          # :quantity will point to the quantity of that product in the cart.
          # We get this quantity from the cart hash. Convert the product id to a string first,because in the cart hash, the keys are strings (as a result of being stored in a cookie).
          quantity: cart[product.id.to_s] 
        } 
      end
  end
  
  # Make enhanced_cart available for use in the view files.
  helper_method :enhanced_cart

  def cart_subtotal_cents
    enhanced_cart.map {|entry| entry[:product].price_cents * entry[:quantity]}.sum
  end
  helper_method :cart_subtotal_cents


  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end
end
