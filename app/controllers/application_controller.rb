class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
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