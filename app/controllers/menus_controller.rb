

class MenusController < ApplicationController
  before_action :find_menu_by_id, only: %i[edit update show destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @menus = Menu.order(created_at: :desc)
    @today_lunch_menu=Menu.where("DATE(meal_date)=? AND meal_type=?", Date.today, 0)
    @today_snack_menu=Menu.where("DATE(meal_date)=? AND meal_type=?", Date.today, 1)
  end

  def new
    @menu = Menu.new
    @dishes = Dish.all
    end
  def create
    @menu = Menu.new(menu_params)
    @menu.user_id= current_user.id

    if menu_already_exists?
      # flash[:alert] = 'Menu with the same meal type and date already exists.'
      redirect_to new_menu_path, notice: t(:duplicate_menu)
    elsif  @menu.save
      redirect_to menus_path(@menu), notice: t(:created)
    else
      redirect_to new_menu_path, notice: t(:missing_field)
    end
  end

  def show
    @reviews = Review.where(menu_id: params[:id])
    @review = Review.new
  end

  def edit; end

  def update
    if @menu.update(menu_params)
      redirect_to menus_path(@dish), status: :see_other, notice: t(:updated)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @menu.destroy
    flash[:notice] = t(:deleted)
    redirect_to menus_path, status: :see_other
  end

  private

  def menu_params
    params.require(:menu).permit(:meal_type, :meal_date, dish_ids: [])
  end

  def find_menu_by_id
    @menu = Menu.find(params[:id])
    @dishes = Dish.all
  end

  def menu_already_exists?
    existing_menu = Menu.find_by(meal_type: @menu.meal_type, meal_date: @menu.meal_date)
    existing_menu.present? && existing_menu != @menu
  end
end
