class User < ActiveRecord::Base

  # Added by Koudoku.
  has_one :subscription


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ergos
  has_many :weights
  has_many :morning_monitorings
  has_many :pbs
  has_many :waters

  validates :name, presence: true
  validates :club, presence: true

  #after_create :create_a_customer
  after_create :send_welcome_email

  #def create_a_customer
  #        token = self.stripe_card_token
          
   #       customer = Stripe::Customer.create(
    #      :card => token,
     #     :plan => 2000,
      #    :id => coupon,
          #:email => self.email
     # )         

      #   end

private

 def send_welcome_email
 WelcomeMailer.welcome_email(self).deliver
end


  #attr_accessible :avatar
  
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

end
