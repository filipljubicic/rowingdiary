class Ergo < ActiveRecord::Base
	belongs_to :user

	validates :score, presence: true
  	validates :description, presence: true
end
