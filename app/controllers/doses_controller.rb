class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    # we need `cocktail_id` to asssociate review with corresponding cocktail
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.save

    redirect_to cocktail_path(@dose.cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
    # raise
    @dose.destroy

    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end