class RootController < AppController

  get '/' do
    session[:error] ? @error = true : @error = false
    session[:error] = false
    erb :index
  end

  post '/' do
    redirect to("/#{params[:zip]}")
  end

  get '/:zip_url' do
    post_up(params[:zip_url])
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