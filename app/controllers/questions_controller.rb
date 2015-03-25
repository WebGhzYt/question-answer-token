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
	    @question = Question.new(:content => params[:question][:content],:student_id => params[:question][:student_id],:behaf_id => params[:question][:behaf_id])	    	    	    
	    if @question.save
	    	params[:question][:sender_attributes][:ans_mail_id].split(',').each do |d|
        		@sender = Sender.new(:ans_mail_id => d, :question_id => @question.id )	    	
        		if @sender.save	    			    		
				    flash[:success] = "Question created!"			    
		 			Questionmailer.welcome_email(@question,@sender).deliver			    
				    
	    		else
	      			redirect_to 'new'
	      		end
      		end
      		redirect_to root_url

	        # @sender = Sender.new(:ans_mail_id => params[:question][:sender_attributes][:ans_mail_id], :question_id => @question.id )	    	
	    # 	if @sender.save	    			    		
			  #   flash[:success] = "Question created!"			    
	 			# Questionmailer.welcome_email(@question,@sender).deliver			    
			  #   redirect_to root_url
	    # 	else
	    #   		redirect_to 'new'
	    #   	end
	    end
  	end

  private

    def question_params
      params.require(:question).permit(:content,:student_id,:behaf_id,:ans_mail_id)
    end

    def sender_params
	  params.require(:question).permit(:ans_mail_id)    
    end


end
