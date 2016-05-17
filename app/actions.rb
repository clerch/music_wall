helpers do 
  def current_user
    User.find_by(id: session[:user_id])
  end
end

# Homepage (Root path)
get '/' do
  erb :index
end

get '/signup' do 
  @user = User.new
  erb(:signup)
end

post '/signup' do
  @user = User.new(
    email: params[:email],
    avatar_url: params[:avatar_url],
    username: params[:username],
    password: params[:password],
    first_name: params[:first_name],
    last_name: params[:last_name]
  )
  if @user.save
    redirect(to('/'))
  else
    erb(:signup)
  end
end

post '/login' do
  username = params[:username]
  password = params[:password]

#1. find user by username
  user = User.find_by_username(username)

#2. if that user exists
  if user && user.password == password
    session[:user_id] = user.id
    redirect(to('/'))

  else
    @error_message = "Login failed."
    redirect(to('/'))
  end 
end

get '/logout' do 
  session[:user_id] = nil
  redirect(to('/'))
end


get '/tracks' do 
  @tracks = Track.all.sort_by(&:upvote_count).reverse


  ##this allows for us to have access to @messages in the index.erb file.
  erb(:'tracks/index')
end

get '/tracks/new' do 
  @track = Track.new
  erb(:'tracks/new')
end

post '/tracks' do
  @track = Track.new(
    url: params[:url],
    song_title: params[:song_title],
    author: params[:author],
    user_id: current_user.id
    )
  if @track.save
    redirect '/tracks'
  else
    erb(:'tracks/new')
  end
end

get '/tracks/:id' do 
  @track = Track.find(params[:id])
  erb(:'tracks/show')
end

post '/upvotes' do
  track_id = params[:track_id]

  upvote = Upvote.new(track_id: track_id, user_id: current_user.id)
  upvote.save

  redirect(back)
end

delete '/upvotes/:id' do
  upvote = Upvote.find(params[:id])
  upvote.destroy
  redirect(back)
end








# post '/tracks/search' do
#   @track = Track.where
#   erb :'tracks/show'
# end



# delete '/messages/:id' do
#   active record delete method params[:id]

# patch

# put '/messages/:id' do
#   active record edit method 


# get '/messages/:id?action=delete' do
#   active record delete method params[:id]
