class BeersController < ApplicationController

  before_filter :authorize

  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find_by(id: params[:id])
    @comments = @beer.comments
  end

  def new
    @beer = Beer.new
  end

  def create
    beer = Beer.new(beer_params)
    if beer.save
      redirect_to "/beers/#{beer.id}"
    else
      redirect_to '/beers'
    end
  end

  def edit
    @beer = Beer.find_by(id: params[:id])
  end

  def update
    @beer = Beer.find_by(id: params[:id])
    if @beer.update_attributes(beer_params)
      redirect_to "/beers/#{@beer.id}"
    else
      redirect_to '/beers'
    end
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :category, :alc_percent, :description).merge(:user_id => @current_user.id)
  end
end