class QuestionsController < ApplicationController
	# before_action :student_signed_in?, only: [:create, :destroy]

	def index
		# @questions = Question.all
		# @students = Student.all
	end

	def new
		@students = Student.where(:role => false)  	
		@question = Question.new				
	end

	def create		
		# @ans_mail_id_temp = params[:question][:sender_attributes][:ans_mail_id]
	    @question = Question.new(:content => params[:question][:content],:student_id => params[:question][:student_id],:behaf_id => params[:question][:behaf_id],:mail_send => params[:question][:mail_send])
	    if @question.save
	    	params[:question][:sender_attributes][:ans_mail_id].split(',').each do |d|
        		@sender = Sender.new(:ans_mail_id => d, :question_id => @question.id )	    	
        		if @sender.save	    			    		
				    flash[:success] = "Question created!"	

		 			Questionmailer.welcome_email(@question,@sender).deliver
		 			# Questionmailer.complete_ans_email(@question,@sender).deliver

		 			@question.delay(run_at: 1.minutes.from_now).check(@question,@sender)
			 			# 24.hours
			 			# if @question.mail_send == false && 
			 			# 	@question.mail_send = true
			 			# 	Questionmailer.complete_ans_email(@question,@sender).deliver				 			
				 		# end
		 			# if @question.created_at > 1.day.ago && 
			 		# 	# Questionmailer.welcome_email(@question,@sender).deliver_later(wait_until: 24.hours.from_now)
			 		# 	# Questionmailer.welcome_email(@question,@sender).deliver_later(wait: 120.seconds)	
		 			# end
	    		else
	      			redirect_to 'new'
	      		end
      		end
      		redirect_to root_url
	    end
  	end


  private

    def question_params
      params.require(:question).permit(:content,:student_id,:behaf_id,:ans_mail_id,:mail_send)
    end

    def sender_params
	  params.require(:question).permit(:ans_mail_id)    
    end

   

end
