class Questionmailer < ApplicationMailer
	default from: "engrohitjain5@gmail.com"
	def welcome_email(question,sender)
		@mail_to = sender
    	@question = question
        @sender = sender

    	# @sender_wel_ans_id = @sender_ans_id
    	# @question_mail_id[] = @question.ans_mail_id.split(",")
	    @url  = "http://localhost:3000/answeres/new/"
	    #@url  = "https://question-ans.herokuapp.com/answeres/new/"
    	mail(to: @mail_to.ans_mail_id, subject: 'Question For You!!')
        # mail(to: 'godganeshrohit@gmail.com', subject: 'Question For You!!')
    	# mail(to: @question.sender.ans_mail_id, subject: 'Question from localhost')
  	end
end
