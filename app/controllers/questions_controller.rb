class QuestionsController < ApplicationController
  include SessionsHelper
  # 正しい管理者or正しい管理者を親に持つスタッフ→CR
  # 正しい管理者or正しいスタッフ→UD
  before_action :login_admin_user_or_login_user
  before_action :set_admin_user
  before_action :correct_admin_user_or_user_of_correct_admin_user, only:[:index, :new, :create, :show]
  before_action :correct_admin_user_or_correct_user, only:[:edit, :destroy]

  def index
    @questions = Question.all
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

    def login_admin_user_or_login_user
      unless admin_user_signed_in? || user_signed_in?
        flash[:alert]="管理者か従業員でログインしてください"
        redirect_to root_url
      end
    end

    def set_admin_user
      @admin_user = AdminUser.find(params[:admin_user_id])
    end

    def correct_admin_user_or_user_of_correct_admin_user
      if admin_user_signed_in?
        unless current_admin_user?(@admin_user)
          flash[:alert]="権限がありません"
          redirect_to root_url
        end
      elsif user_signed_in?
        unless @admin_user == current_user.admin_user
          flash[:alert]="権限がありません"
          redirect_to root_url
        end
      end
    end

    def correct_admin_user_or_correct_user
      if admin_user_signed_in? 
        unless current_admin_user?(@admin_user) 
          flash[:alert]="権限がありません"
          redirect_to root_url
        end
      elsif user_signed_in?
        unless @question.current_user.id == current_user.id
          flash[:alert]="権限がありません"
          redirect_to root_url
        end
      end
    end

end
