class AnsweresController < ApplicationController
  
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
  end

  def create    
      @answere = Answere.new(answere_params)
      if @answere.save

          if @question.created_at > 1.day.ago && 
            # Questionmailer.welcome_email(@question,@sender).deliver_later(wait_until: 24.hours.from_now)
            # Questionmailer.welcome_email(@question,@sender).deliver_later(wait: 120.seconds)  
          end
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

end
