class ReviewsController < ApplicationController

  before_action :find_attendance_by_id, only: %i[destroy]


  def new
    @review = Review.new
    @users = User.all
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to menus_path, notice: 'Successfully created'
    else
      render :index, status: :unprocessable_entity
    end
  end


  def destroy
    @review.destroy
    flash[:notice] = 'Review was successfully deleted'
    redirect_to  menus_path, status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:review_body, :rating, :user_id, :menu_id)
  end

  def find_attendance_by_id
    @review = Review.find(params[:id])
  end

end