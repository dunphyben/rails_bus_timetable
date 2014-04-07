class StationsController < ApplicationController

  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(user_params)
    if @station.save
      @station.line_ids = params[:line_ids]
      flash[:notice] = "Station created."
      redirect_to stations_path
    else
      render 'new'
    end
  end

  def show
    @lines = Line.all
    @station = Station.friendly.find(params[:id])
    if request.path != station_path(@station)
      redirect_to @station, status: :moved_permanently
    end
  end

  def edit
    @station = Station.friendly.find(params[:id])
  end

  def update
    @station = Station.friendly.find(params[:id])
    if @station.update( )
      @station.line_ids = params[:line_ids]
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

  private
  def user_params
    params.require(:station).permit(:name)
  end
end
