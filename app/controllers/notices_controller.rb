

class NoticesController < ApplicationController
  before_action :find_menu_by_id, only: %i[edit update show destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @notices = Notice.all
  end

  def new
    @notice = Notice.new
    @users = User.all
  end

  def create
    @notice = Notice.new(notice_params)
    @notice.user_id=current_user.id
    if @notice.save
      redirect_to notices_path(@notice), notice: 'Successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @notice.update(notice_params)
      redirect_to notices_path(@notice), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @notice.destroy
    flash[:notice] = 'Notice was successfully deleted'
    redirect_to notices_path, status: :see_other
  end

  private

  def notice_params
    params.require(:notice).permit(:notice_title, :notice_body)
  end

  def find_menu_by_id
    @notice = Notice.find(params[:id])
    @users = User.all
  end
end
