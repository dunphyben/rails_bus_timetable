class StationsController < ApplicationController

  def index
    @stations = Station.all
  end

  def new
    @stations = Station.new
  end

  def create
    @station = Station.new(params[:station])
    if @station.save
      flash[:notice] = "Station created."
      redirect_to stations_path
    else
      render 'new'
    end
  end

  def show
    @station = Station.friendly.find(params[:id])
    if request.path != station_path(@station)
      redirect_to @station, status: :moved_permanently
    end
  end

  def update
    @station = Station.friendly.find(params[:id])
    if @station.update(params[:station])
      flash[:notice] = "Station updated."
      redirect_to stations_path(@station)
    else
      render 'edit'
    end
  end

  def destroy
    @station = Station.friendly.find(params[:id])
    @station.destroy
    flash[:notice] = "Station deleted."
    redirect_to stations_path
  end
end
