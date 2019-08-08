class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
  end

  def create
  end

  def show
  end
end
