class CocktailsController < ApplicationController

  before_action :find_cocktail, only: [:show, :destroy]
  def index
    @cocktails = Cocktail.all
  end
  def show
  end
  def new
    @cocktail = Cocktail.new
  end
  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      flash[:notice] = "Cocktail #{@cocktail.name} has been created"
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end
  def destroy
    @cocktail = Cocktail.destroy
  end
  private
  def cocktail_params
    params.require(:cocktail).permit(:name, :picture)
  end
  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end

