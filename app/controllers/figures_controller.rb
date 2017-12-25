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
      @figure.titles << title
    end
    if !params[:landmark].empty?
      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark
    end

    redirect "figures/#{@figure.id}"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

end
