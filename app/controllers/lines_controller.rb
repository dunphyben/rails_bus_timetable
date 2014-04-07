class LinesController < ApplicationController

  def index
    @lines = Line.all
  end

  def new
    @line = Line.new
  end

  def create
    @line = Line.new(params[:line])
    if @line.save
      flash[:notice] = "Line created."
      redirect_to lines_path
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
    if @line.update(params[:id])
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
end
