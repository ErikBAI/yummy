class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  before_filter :load_restaurant

  # GET /dishes
  # GET /dishes.json
  def index
    @dishes = @restaurant.dishes.all
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
    @dish = @restaurant.dishes.find(params[:id])
  end

  # GET /dishes/new
  def new
    @dish = @restaurant.dishes.new
  end

  # GET /dishes/1/edit
  def edit
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = @restaurant.dishes.new(dish_params)

    respond_to do |format|
      if @dish.save
        format.html { redirect_to [@restaurant, @dish], notice: 'Dish was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dish }
      else
        format.html { render action: 'new' }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to [@restaurant, @dish], notice: 'Dish was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_dishes_path(@restaurant) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:name, :price, :restaurant_id)
    end

    def load_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
