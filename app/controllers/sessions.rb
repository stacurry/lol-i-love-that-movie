get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  if (user = User.authenticate(params))
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["The email and password you entered do not match our database. Please try again."]
    erb :"sessions/new"
  end
end

delete '/sessions' do
  session[:user_id] = nil
  redirect '/'
end