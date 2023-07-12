

class MealAttendancesController < ApplicationController
  before_action :find_attendance_by_id, only: %i[edit update show destroy]
  def index
    @MealAttendances = MealAttendance.all
    @today_lunch_count=MealAttendance.where("DATE(meal_date)=? AND meal_type=?", Date.today,0).count
    @today_snack_count=MealAttendance.where("DATE(meal_date)=? AND meal_type=?", Date.today,1).count
  end

  def new
    @MealAttendance = MealAttendance.new
    @users = User.all
  end

  def create
    @MealAttendance = MealAttendance.new(mealAttendance_params)
    @MealAttendance.user_id = current_user.id
    if @MealAttendance.save
      redirect_to meal_attendances_path, notice: 'Successfully created'
    else
      redirect_to meal_attendances_path, notice: 'cant give empty date or past attendance'
    end
  end

  def show; end

  def edit; end

  def update
    if @MealAttendance.update(mealAttendance_params)
      redirect_to meal_attendances_path(@MealAttendances), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @MealAttendance.destroy
    flash[:notice] = 'MealAttendance was successfully deleted'
    redirect_to meal_attendances_path, status: :see_other
  end

  private

  def mealAttendance_params
    params.require(:meal_attendance).permit(:meal_type, :meal_date)
  end

  def find_attendance_by_id
    @MealAttendance = MealAttendance.find(params[:id])
  end
end
