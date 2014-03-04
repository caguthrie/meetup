class RestaurantApp < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    @ziparg = params["ziparg"]
    redirect to("/#{@ziparg}")
    erb :index
  end

  get '/:zip_url' do
    @zip_url = params[:zip_url].to_i
    if !Restaurant.exists?(zip: @zip_url)
      @message = "Error, invalid zipcode"
      redirect to("/")
    else
      @message = ""
      erb :zip_page
    end
  end

  post '/no-zip' do
    erb :no_zip
  end
end