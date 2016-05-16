# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do 
  @tracks = Track.all 
  ##this allows for us to have access to @messages in the index.erb file.
  erb :'tracks/index'
end

post '/tracks' do
  @track = Track.new(
    url: params[:url],
    song_title: params[:song_title],
    author: params[:author]
    )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

get '/tracks/new' do 
  @track = Track.new
  erb :'tracks/new'
end

get '/tracks/:id' do 
  @track = Track.find params[:id]
  erb :'tracks/show'
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
