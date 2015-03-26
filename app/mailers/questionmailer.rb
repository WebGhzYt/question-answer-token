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
    def complete_ans_email(question,sender)
        # @mail_to = sender
        @question_behaf_id = question.behaf_id
        @student = Student.find(@question_behaf_id)
            # logger.debug  question.behaf_id
            # logger.debug "22222222222" 
            # logger.debug @student.email
            # logger.debug @student.id
        # @sender = sender
        # @sender_wel_ans_id = @sender_ans_id
        # @question_mail_id[] = @question.ans_mail_id.split(",")
        @url  = "http://localhost:3000/students/sign_in"        
        #@url  = "https://question-ans.herokuapp.com/answeres/new/"
        mail(to: @student.email, subject: 'Time Complete or all Answare is done!!')
        # mail(to: 'godganeshrohit@gmail.com', subject: 'Question For You!!')
        # mail(to: @question.sender.ans_mail_id, subject: 'Question from localhost')
    end
end
