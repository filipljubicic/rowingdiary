class ChargesController < ApplicationController
	before_filter :authenticate_user!

def new
end

def create
  # Amount in cents
@amount = 999

  	customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
	    :card  => params[:stripeToken]
	    
  )

	Stripe::Plan.create(
	  :amount => 250,
	  :interval => 'month',
	  :interval_count => '3',
	  :name => 'Individual',
	  :currency => 'usd',
	  :id => '2000'
	)

	Stripe::Coupon.create(
  		:percent_off => 100,
  		:duration => 'once',
  		:id => '1988'
)

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end
end