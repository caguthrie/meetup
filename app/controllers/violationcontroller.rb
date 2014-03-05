class ViolationController < AppController

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
  
end