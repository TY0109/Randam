class QuestionsController < ApplicationController
  before_action :set_admin_user

  def index
    if admin_user_signed_in?
      @questions = Question.all
    elsif user_signed_in?
      @questions = Question.where(user_id:current_user.id)
    end
    # @chapter1_questions= @admin_user.questions.where(chapter: 1)
    # @chapter1_question_selected = @chapter1_questions.offset( rand( @chapter1_questions.count ) ).first
    
    # @chapter2_questions=@admin_user.questions.where(chapter:2)
    # @chapter2_question_selected = @chapter2_questions.offset( rand( @chapter2_questions.count ) ).first
    
    # @chapter3_questions=@admin_user.questions.where(chapter:3)
    # @chapter3_question_selected = @chapter3_questions.offset( rand( @chapter3_questions.count ) ).first
    
    # @chapter4_questions=@admin_user.questions.where(chapter:4)
    # @chapter4_question_selected = @chapter4_questions.offset( rand( @chapter4_questions.count ) ).first
  end

  def new
    @folders = @admin_user.folders
    @question = @admin_user.questions.build
  end

  def create
    @question = @admin_user.questions.build(question_params)
    respond_to do |format|
      format.any
      if @question.save
        flash[:success]="問題を投稿しました"
        redirect_to root_url
      else
        render :new
      end
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.image.purge
    question.destroy
    flash[:success] = "問題を削除しました"
    redirect_to root_url
  end

  
  private
    def question_params
      params.require(:question).permit(:chapter, :image, :admin_user_id, :user_id, :folder_in)
    end

    def set_admin_user
      @admin_user = AdminUser.find(params[:admin_user_id])
    end


end
