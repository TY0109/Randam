module SessionsHelper
    
  # def log_in(user)〜def logoutは定義不要
      
  # def logged_in?　は定義不要
  
  # def current_user　は定義不要
  
  
  # 渡されたユーザーがログイン済みのユーザーであればtrueを返します。
    def current_user?(user)
      user == current_user
    end
  
  
  end