class AnsweresController < ApplicationController
  # before_filter :new




  def show
    # @new_student_mail_id = params[:id]
  end
  
  def new         
    @token = params[:id]
    @sender = Sender.where(token: @token).first
    @new_student_mail_id = @sender.ans_mail_id
    @question_id = @sender.question_id   
    @question = Question.where(id: @question_id).first   
    @answere = Answere.new
    # load_foo()
    # save_foo()

  end

  def create    
      @answere = Answere.new(answere_params)
      @token = params[:id]
      @sender = Sender.where(token: @token).first
      @new_student_mail_id = @sender.ans_mail_id
      @question_id = @sender.question_id   
      @question = Question.where(id: @question_id).first  
      
      if @answere.save      
          # logger.debug "11111111111" 
         # logger.debug @question.mail_send

         @question_id = @answere.question_id   
         @question = Question.where(id: @question_id).first  

         if @question.mail_send == false     
          logger.debug "11111111111" 
            logger.debug @question.mail_send
            @question.update(mail_send: true)
            # question = Question.find_by(id: @question.id)
            # question.mail_send = true
            Questionmailer.complete_ans_email(@question,@sender).deliver    
          end


          # if @question.mail_send == false
          #   # logger.debug "11111111111" 
          #   # logger.debug @question.mail_send
         
          #  # @question.update(mail_send: true)
          # # question = Question.find_by(id: @question.id)
          # # question.mail_send = true
                   
          
          # # check_ans(@question,@sender)
          
          # end
        
            # 24.hours
          # if @question.created_at < 1.day.ago && 
          #   # Questionmailer.welcome_email(@question,@sender).deliver_later(wait_until: 24.hours.from_now)
          #   # Questionmailer.welcome_email(@question,@sender).deliver_later(wait: 120.seconds)  
          # end
          # t1 = DateTime.now
          # t2 = @question.created_at
          
          # if ( t1.hour >= t2.hour + 24 )
          #here check ans of all questions of particuler question number(id) Or 24 hours complete
            # Questionmailer.complete_ans_email(@question,@sender).deliver
          # end
        flash[:success] = "Answare created!"        
        redirect_to root_url
      else
        redirect_to 'new'
      end
    end

  private

    def answere_params
      params.require(:answere).permit(:content,:mail_id,:question_id)
    end
    def load_foo
      @token = params[:id]
      @sender = Sender.where(token: @token).first
      @new_student_mail_id = @sender.ans_mail_id
      @question_id = @sender.question_id   
      @question = Question.where(id: @question_id).first  
      
      @session_question = session[:foo] || @question
      @session_
    end

    def save_foo
      session[:foo] = @session_question
    end

end
