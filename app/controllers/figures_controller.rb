class FiguresController <ApplicationController

  get "/figures" do
    binding.pry
    erb :'figures/index'
  end
end
