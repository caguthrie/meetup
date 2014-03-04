class RestaurantApp < Sinatra::Base
  set :session_secret, "vomit"
  enable :sessions

  get '/' do
    session[:error] ? @error = true : @error = false
    session[:error] = false
    erb :index
  end

  post '/' do
    post_up(params["zip"])
  end

  get '/:zip_url' do
    post_up(params[:zip_url])
  end

  get '/restaurant/:rest_id' do
    @rest_id = params[:rest_id]
    if Restaurant.exists?(id: @rest_id)
      session[:error] = false
      erb :rest_page
    else
      session[:error] = true
      redirect to("/")
    end
  end

  get '/violation/:vio_id' do
    @vio_id = params[:vio_id]
    if Violation.exists?(id: @vio_id)
      session[:error] = false
      erb :vio_page
    else
      session[:error] = true
      redirect to("/")
    end
  end

  def post_up(p)
    @zip_url = p.to_i
    @worst = Restaurant.worst_restaurant_in_zip(@zip_url, 3)
    if !Restaurant.exists?(zip: @zip_url)
      session[:error] = true
      redirect to("/")
    else
      session[:error] = false
      erb :zip_page
    end
  end

end