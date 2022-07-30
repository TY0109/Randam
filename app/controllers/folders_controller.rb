class FoldersController < ApplicationController
  include SessionsHelper
  # 正しい管理者→CUD
  # 正しい管理者or親が正しい管理者であるスタッフ→R

  before_action :login_admin_user_or_login_user, only:[:new,:create, :index, :show] 
  before_action :set_admin_user
  before_action :correct_admin_user, only:[:new, :create] 
  before_action :correct_admin_user_or_user_of_correct_admin_user, only:[:index, :show]
  before_action :set_folder, only:[:show, :randam]

  def new
    @folder = @admin_user.folders.build
  end

  def create
    @folder = @admin_user.folders.build(folder_params)
    if @folder.save
      flash[:success]="フォルダーを作成しました"
      redirect_to admin_user_folders_url(@admin_user)
    else
      render :new
    end
  end

  def index
    @folders = @admin_user.folders
  end

  def show
    @questions = @admin_user.questions.where(folder_in: @folder.name)
  end
  
  # テストページ。非ログインでも閲覧可能
  def randam
    @questions = @admin_user.questions.where(folder_in: @folder.name )
    
    @chapter1_questions=@questions.where(chapter: 1) 
    @chapter1_question_selected = @chapter1_questions.offset( rand( @chapter1_questions.count ) ).first

    @chapter2_questions=@questions.where(chapter:2)
    @chapter2_question_selected = @chapter2_questions.offset( rand( @chapter2_questions.count ) ).first
    
    @chapter3_questions=@questions.where(chapter:3)
    @chapter3_question_selected = @chapter3_questions.offset( rand( @chapter3_questions.count ) ).first
    
    @chapter4_questions=@questions.where(chapter:4)
    @chapter4_question_selected = @chapter4_questions.offset( rand( @chapter4_questions.count ) ).first
    
    @chapter5_questions=@questions.where(chapter: 5) 
    @chapter5_question_selected = @chapter5_questions.offset( rand( @chapter5_questions.count ) ).first

    @chapter6_questions=@questions.where(chapter:6)
    @chapter6_question_selected = @chapter6_questions.offset( rand( @chapter6_questions.count ) ).first
    
    @chapter7_questions=@questions.where(chapter:7)
    @chapter7_question_selected = @chapter7_questions.offset( rand( @chapter7_questions.count ) ).first
    
    @chapter8_questions=@questions.where(chapter:8)
    @chapter8_question_selected = @chapter8_questions.offset( rand( @chapter8_questions.count ) ).first
    
  end


  private
    def folder_params
      params.require(:folder).permit(:name, :admin_user_id , {:user_ids => []})
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

    def correct_admin_user
      unless current_admin_user?(@admin_user)
        flash[:alert]="権限がありません"
        redirect_to root_url
      end
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

    def set_folder
      @folder = @admin_user.folders.find(params[:id])
    end

      
    
    
  end



