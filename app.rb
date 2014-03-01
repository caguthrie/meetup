class RestaurantApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/:zip_url' do
    @zip_url = params[:zip_url].to_i
    # binding.pry
    if !Restaurant.exists?(zip: @zip_url)
      erb :no_zip
    else
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