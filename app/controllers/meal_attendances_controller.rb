

class MealAttendancesController < ApplicationController
  before_action :find_attendance_by_id, only: %i[edit update show destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @today_lunch_count=MealAttendance.where("DATE(meal_date)=? AND meal_type=?", Date.today,0).count
    @today_snack_count=MealAttendance.where("DATE(meal_date)=? AND meal_type=?", Date.today,1).count

    new_query={}
    new_query.merge!(meal_type: params[:category]) if params[:category].present? && params[:category]!=''
    new_query.merge!(meal_date: params[:search_date]) if params[:search_date].present? && params[:search_date]!=''

    new_query.compact_blank
    new_query.compact!

    @MealAttendances=MealAttendance.where(new_query)
    @MealAttendances=@MealAttendances.joins(:user).where("first_name LIKE ?", "%#{params[:search].delete(' ')}%") if params[:search].present? && params[:search]!=''
  end

  def new
    @MealAttendance = MealAttendance.new
    @users = User.all
  end

  def create
    @MealAttendance = MealAttendance.new(meal_attendance_params)
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

  def meal_attendance_params
    params.require(:meal_attendance).permit(:meal_type, :meal_date)
  end

  def find_attendance_by_id
    @MealAttendance = MealAttendance.find(params[:id])
  end
end
