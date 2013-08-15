before do
  @errors = session.delete(:errors) || []
end

get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  if current_user
    @users = User.all
  end
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page 
  erb :sign_in
end

post '/sessions' do
  user = User.find_by_email(params[:email])
  if log_in(user, params[:password])
    redirect '/'
  else
    session[:errors] = ['Invalid login']
    redirect to '/sessions/new'
  end
end

delete '/sessions/:id' do
  log_out
  # sign-out -- invoked via AJAX
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  user = User.create(params[:user])
  redirect '/'
  # sign-up a new user
end
