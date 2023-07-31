require 'doorkeeper/grape/helpers'
module V1
  module Resources
    class MealAttendances < Grape::API
      helpers Doorkeeper::Grape::Helpers
      before do
        doorkeeper_authorize!
      end

      before do
        @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
        error!('401 Unauthorized', 401) unless @current_user.admin? or @current_user.sup_admin?
      end
      resources :meal_attendances do
        desc 'get all the attendances'
        get do
          @meal_attendances=MealAttendance.all
          present @meal_attendances, with: V1::Entities::MealAttendances
        end
      end
    end
  end
end
