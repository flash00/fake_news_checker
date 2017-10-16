get '/articles' do
  @articles = Article.all
  erb :'/articles/index'
end

get '/articles/new' do
  @article = Article.new
  erb :'/articles/new'
end

post '/articles' do
  @article = Article.new(params[:article])
  if @article.save
    redirect "articles/#{@article.id}"
  else
    erb :"/articles/new"
end

get '/articles/:id' do
  @article = Article.find_by(id: params[:id])
  erb :'articles/show'
end

delete '/articles/:id'
  article.delete(:id)
  redirect '/'
end