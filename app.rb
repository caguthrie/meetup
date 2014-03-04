class RestaurantApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    @zip_url = params["zip"].to_i
    @worst = Restaurant.worst_restaurant_in_zip(@zip_url, 3)
    if !Restaurant.exists?(zip: @zip_url)
      @message = "Error, invalid zipcode!"
      redirect to{"/"}
    else
      @message = ""
      erb :zip_page
    end
  end

  get '/:zip_url' do
    @zip_url = params[:zip_url].to_i
    @worst = Restaurant.worst_restaurant_in_zip(@zip_url, 3)
    if !Restaurant.exists?(zip: @zip_url)
      @message = "Error, invalid zipcode!"
      redirect to{"/"}
    else
      @message = ""
      erb :zip_page
    end
  end

  # post '/' do
  #   m = Message.new
  #   m.from = params[:from]
  #   m.content = params[:content]
  #   m.save
  #   "success"
  # end

end