

class DishesController < ApplicationController
  before_action :find_dish_by_id, only: %i[edit update show destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to dishes_path(@dish), notice: t(:created)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @dish.update(dish_params)
      redirect_to dishes_path(@dish), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dish.destroy
    flash[:notice] = t(:deleted)
    redirect_to dishes_path, status: :see_other
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :ingredients, :image)
  end

  def find_dish_by_id
    @dish = Dish.find(params[:id])
  end
end
