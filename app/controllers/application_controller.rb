class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception
 before_filter :configure_permitted_parameters, if: :devise_controller?

protected

 def configure_permitted_parameters
 	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :club, :stripe_card_token, :email, :password, :coupon) }
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :club, :stripe_card_token, :coupon) }

 end

 
end

#def create
#  @user = User.create( user_params )
#end

#private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

#def user_params
 # params.require(:user).permit(:avatar)
#end