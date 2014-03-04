class RestaurantApp < Sinatra::Base

  get '/' do
    @message = @@message
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
      @@message = "Error, invalid zipcode!"
      redirect to{"/"}
    else
      @@message = ""
      erb :zip_page
    end
  end

end