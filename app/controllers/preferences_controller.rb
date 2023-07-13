

class PreferencesController < ApplicationController
  before_action :find_menu_by_id, only: %i[edit update show destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @preferences = Preference.all
  end

  def new
    @preference = Preference.new
    @users = User.all
  end

  def create
    @preference = Preference.new(preference_params)
    @preference.user_id=current_user.id
    if @preference.save
      redirect_to preferences_path(@preference), notice: 'Successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @preference.update(preference_params)
      redirect_to preferences_path(@preference), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @preference.destroy
    flash[:notice] = 'Dish was successfully deleted'
    redirect_to preferences_path, status: :see_other
  end

  private

  def preference_params
    params.require(:preference).permit(:restricted_food)
  end

  def find_menu_by_id
    @preference = Preference.find(params[:id])
    @users = User.all
  end
end
