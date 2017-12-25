class FiguresController <ApplicationController

  get "/figures" do
    erb :'figures/index'
  end

  get "/figures/new" do

    erb :'figures/new'
  end

  post "/figures" do
    @figure = Figure.create(params[:figure])
    if !params[:title].empty?
      title = Title.create(params[:title])
      @figure.title << title
    end
    if !params[:landmark].empty?
      landmark = Landmark.create(params[:landmark])
      @figure.landmark << landmark
    end

    redirect "figures/#{@figure.id}"
  end

end
