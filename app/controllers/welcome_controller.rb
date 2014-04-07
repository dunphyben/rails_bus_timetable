class WelcomeController < ApplicationController
  def index
    @stations = Station.all
    @lines = Line.all
  end

end
