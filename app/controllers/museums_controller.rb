class MuseumsController < ApplicationController
  attr_reader :museum, :museums
  helper_method :museum, :museums

  before_filter :authenticate_user!, except: [:index, :show]

  def index
    if params[:s]
      @museums = Museum.by_region(params[:s])
    else
      @museums = Museum.by_region
    end
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

  def show
    @museum = Museum.find(params[:id])
  end
end