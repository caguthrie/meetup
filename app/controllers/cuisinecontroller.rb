class CuisineController < AppController
  get '/cuisine/:cuis_id' do
    @cuis_id = params[:cuis_id]
    if Cuisine.exists?(id: @cuis_id)
      session[:error] = false
      erb :cuis_page
    else
      session[:error] = true
      redirect to("/")
    end
  end  
end