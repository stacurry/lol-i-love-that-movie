get '/users/new' do
  erb :"users/new"
end

post '/users' do
  new_user = User.new(params[:user])

  if new_user.save
    session[:user_id] = new_user.id
    redirect "/users/#{new_user.id}"
  else
    @errors = new_user.errors.full_messages
    erb :"users/new"
  end
end

get '/users/:id' do
  if session[:user_id] == params[:id].to_i
    @user = current_user
    erb :"users/show"
  else
    redirect '/'
  end
end