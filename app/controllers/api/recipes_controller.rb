class Api::RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all 
    @current_user = current_user

    search_terms = params[:search]
    if search_terms
      @recipes = Recipe.where("title iLike ?", "%#{search_terms}%")
    end

    @recipes = @recipes.order(:id => :asc)

    render 'index.json.jbuilder'
  end

  def show
    @recipe = Recipe.find(params[:id])
    render 'show.json.jbuilder'
  end

  def create
    @recipe = Recipe.new(
                        title: params[:title],
                        chef: params[:chef],
                        ingredients: params[:ingredients],
                        directions: params[:directions],
                        prep_time: params[:prep_time]
                        )
    @recipe.save                      # Note: using Recipe.create() automatically saves but adds more complications
    render 'show.json.jbuilder'
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title] || @recipe.title
    @recipe.chef = params[:chef] || @recipe.chef 
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.image_url = params[:image_url] || @recipe.image_url

    @recipe.save
    render 'show.json.jbuilder'
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    render json: {message: "Successfully removed recipe."}
  end
end
