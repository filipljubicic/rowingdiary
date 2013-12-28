class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ergos
  has_many :weights

  validates :name, presence: true
  validates :club, presence: true

  after_create :create_a_customer

  def create_a_customer
          token = self.stripe_card_token
          
          customer = Stripe::Customer.create(
          :card => token,
          :plan => 1972,
          :coupon => coupon,
          :email => self.email
      )         

         end


  #attr_accessible :avatar
  
  #has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

end
