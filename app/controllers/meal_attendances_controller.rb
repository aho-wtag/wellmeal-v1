class MealAttendancesController < ApplicationController
  before_action :find_attendance_by_id, only: %i[edit update show destroy]
  def index
    @MealAttendances = MealAttendance.all
  end

  def new
    @MealAttendance = MealAttendance.new
    @users = User.all
  end

  def create
    @MealAttendance = MealAttendance.new(mealAttendance_params)
    if @MealAttendance.save
      redirect_to MealAttendances_path(@MealAttendance), notice: 'Successfully created'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @MealAttendance.update(mealAttendance_params)
      redirect_to MealAttendances_path(@MealAttendance), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @MealAttendance.destroy
    flash[:notice] = 'MealAttendance was successfully deleted'
    redirect_to  meal_attendances_path, status: :see_other
  end

  private

  def mealAttendance_params
    params.require(:MealAttendance).permit(:meal_type, :meal_date, :user_id)
  end

  def find_attendance_by_id
    @dish = MealAttendance.find(params[:id])
  end
end