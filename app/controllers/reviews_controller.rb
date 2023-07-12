

class ReviewsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def new
    @review = Review.new
    @users = User.all
  end

  def create
    @review = Review.new(review_params)
    @review.user_id=current_user.id
    if @review.save
      redirect_to menu_path(@review.menu), notice: 'Successfully created'
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = 'Review was successfully deleted'
    redirect_to menu_path(@review.menu), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:review_body, :rating, :menu_id)
  end
end
