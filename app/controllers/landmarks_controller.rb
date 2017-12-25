class LandmarksController < ApplicationController

  get "/landmarks" do
    erb :'landmarks/index'
  end

  get "/landmarks/new" do
    erb :'landmarks/new'
  end

  post "/landmarks" do
    @landmark = Landmark.create(params[:landmark])
    if !params[:landmark].empty?
      @landmark.name = params[:landmark]
    end
    @landmark.save
    redirect "landmarks/#{@landmark.id}"
  end



  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    redirect "landmarks/#{@landmark.id}"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end
end
