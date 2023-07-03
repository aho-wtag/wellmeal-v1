
class MenusController < ApplicationController
  before_action :find_menu_by_id, only: %i[edit update show destroy]
  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
    @dishes = Dish.all
    @users = User.all
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menus_path(@menu), notice: 'Successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @menu.update(menu_params)
      redirect_to menus_path(@dish), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @menu.destroy
    flash[:notice] = 'Dish was successfully deleted'
    redirect_to menus_path, status: :see_other
  end

  private

  def menu_params
    params.require(:menu).permit(:meal_type, :meal_date, :user_id , dish_ids: [])
  end

  def find_menu_by_id
    @menu = Menu.find(params[:id])
    @dishes = Dish.all
    @users = User.all
  end
end
