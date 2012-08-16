class MuseumsController < ApplicationController
  attr_reader :museum, :museums
  helper_method :museum, :museums

  def index
    @museums = Museum.all
  end

  def new
    @museum = Museum.new
  end

  def create
    @museum = Museum.new(params[:museum])
    if @museum.save
      flash[:notice] = "Museum Created"
      redirect_to museums_path
    else
      flash[:error] = "Error Creating Museum"
      render :new
    end
  end
end