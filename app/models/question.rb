class Question < ActiveRecord::Base
	belongs_to :student
	belongs_to :sender	  
	has_many :sender, dependent: :destroy	
	accepts_nested_attributes_for :sender 
end
