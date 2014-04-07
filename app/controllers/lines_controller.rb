class LinesController < ApplicationController

  def index
    @lines = Line.all
  end

  def new
    @line = Line.new
  end

  def create
    @line = Line.new(user_params)
    if @line.save
      @line.station_ids = params[:station_ids]
      flash[:notice] = "Line created."
      redirect_to line_path(@line)
    else
      render 'new'
    end
  end

  def show
    @line = Line.friendly.find(params[:id])
    if request.path != line_path(@line)
      redirect_to @line, status: :moved_permanently
    end
  end

  def edit
    @line = Line.friendly.find(params[:id])
  end

  def update
    @line = Line.friendly.find(params[:id])
    if @line.update(user_params)
      @line.station_ids = params[:station_ids]
      flash[:notice] = "Line updated"
      redirect_to line_path(@line)
    else
      render 'edit'
    end
  end

  def destroy
    @line = Line.friendly.find(params[:id])
    @line.destroy
    flash[:notice] = "Line deleted"
    redirect_to lines_path
  end

  private
  def user_params
    params.require(:line).permit(:name)
  end
end
