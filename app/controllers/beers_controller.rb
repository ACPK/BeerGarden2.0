class BeersController < ApplicationController

  before_filter :authorize

  def index
    @beers = Beer.all
  end
end