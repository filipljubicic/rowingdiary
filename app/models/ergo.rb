class Ergo < ActiveRecord::Base
	belongs_to :user

  	validates :description, presence: true
  	validates :split, presence: true
  	validates :rate, presence: true
  	validates :distance, presence: true
  	validates :time, presence: true
  	validates :watts, presence: false
end
