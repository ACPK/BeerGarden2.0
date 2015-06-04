class BeersController < ApplicationController

  before_filter :authorize

  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
    @comments = @beer.comments
  end

end