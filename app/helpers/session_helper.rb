module SessionHelper
  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end
end