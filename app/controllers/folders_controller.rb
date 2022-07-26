class FoldersController < ApplicationController
  before_action :set_admin_user
  before_action :set_folder, only:[:show]
  before_action :right_user, only:[:show]

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
    @questions = Question.where(folder_in: @folder.name )
    
    @chapter1_questions=@questions.where(chapter: 1) 
    @chapter1_question_selected = @chapter1_questions.offset( rand( @chapter1_questions.count ) ).first

    @chapter2_questions=@questions.where(chapter:2)
    @chapter2_question_selected = @chapter2_questions.offset( rand( @chapter2_questions.count ) ).first
    
    @chapter3_questions=@questions.where(chapter:3)
    @chapter3_question_selected = @chapter3_questions.offset( rand( @chapter3_questions.count ) ).first
    
    @chapter4_questions=@questions.where(chapter:4)
    @chapter4_question_selected = @chapter4_questions.offset( rand( @chapter4_questions.count ) ).first
    
  end

  private
    def folder_params
      params.require(:folder).permit(:name, :admin_user_id , {:user_ids => []})
    end
   
    def set_admin_user
      @admin_user = AdminUser.find(params[:admin_user_id])
    end

    def set_folder
      @folder = Folder.find(params[:id])
    end

    def right_user
      unless admin_user_signed_in?
        @right_folder = @folder.user_folders.find_by(user_id:current_user.id, folder_id:@folder.id)
        unless @right_folder
          flash[:alert]="権限がないため閲覧できません。"
          redirect_to root_url
        end
      end
    end
end


