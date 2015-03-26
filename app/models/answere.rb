class Answere < ActiveRecord::Base
	belongs_to :sender	  
	belongs_to :question	  
	def check_ans(question,sender)
		 	@question = question
		 	@sender = sender
			if @question.mail_send == false			
				@question.update(mail_send: true)
				# question = Question.find_by(id: @question.id)
				# question.mail_send = true
				Questionmailer.complete_ans_email(@question,@sender).deliver		
			end
	end

end
