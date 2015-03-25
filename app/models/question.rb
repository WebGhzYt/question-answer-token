class Question < ActiveRecord::Base
	belongs_to :student
	belongs_to :sender	  
	has_many :sender, dependent: :destroy	
	accepts_nested_attributes_for :sender 

	 def check
		if @question.mail_send == false
			@question.mail_send = true
			Questionmailer.complete_ans_email(@question,@sender).deliver		
		end
    end
    
end
