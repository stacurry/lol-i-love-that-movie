def current_user
  User.find_by(id: session[:user_id])
end

def logged_in?
  session[:user_id] != nil
end

def check_login
  redirect "/sessions/new" unless logged_in?
end