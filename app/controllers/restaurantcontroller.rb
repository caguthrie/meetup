class RestaurantController < AppController

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

end