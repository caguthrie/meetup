class RestaurantApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    post_up(params["zip"])
  end

  get '/:zip_url' do
    post_up(params[:zip_url])
  end

  def post_up(p)
    @zip_url = p.to_i
    @worst = Restaurant.worst_restaurant_in_zip(@zip_url, 3)
    if !Restaurant.exists?(zip: @zip_url)
      redirect to("/")
    else
      erb :zip_page
    end
  end

end