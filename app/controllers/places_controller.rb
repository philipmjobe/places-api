class PlacesController < ApplicationController
  def index 
    places = Place.all 
    render json: places.as_json
  end

  def show
    place = Place.find_by(id: params[:id])
    render json: place.as_json
  end

  def create
    place = Place.new(name: params[:name], address: params[:address])
    if place.save
      render json: {message: "Place added"}
    else  
      render json: {error: place.error.all_messages}
    end 
  end 

  def update
    place = Place.find_by(id: params[:id])
    place.name = params[:name] || place.name
    place.address = params[:address] || place.address
    if place.save
      render json: {message: "Place Updated!"}
    else
      render json: {error: place.error.all_messages}
    end
  end 

  def destroy
    place = Place.find_by(id: params[:id])
    if place.delete
      render json: {message: "Place Destroyed"}
    else
      render json: {error: place.error.all_messages}
    end
  end 
end