class QuestionsController < ApplicationController
  before_action :authenticate_user!
 
  def index
    # @questions=Question.all
    @chapter1_questions=Question.where(chapter:1)
    @chapter2_questions=Question.where(chapter:2)
    @chapter3_questions=Question.where(chapter:3)
    @chapter4_questions=Question.where(chapter:4)
    @chapter5_questions=Question.where(chapter:5)
    @chapter6_questions=Question.where(chapter:6)
    @chapter7_questions=Question.where(chapter:7)
    @chapter8_questions=Question.where(chapter:8)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
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

  

  private
    def question_params
      params.require(:question).permit(:chapter, :image, :user_id)
    end


end
