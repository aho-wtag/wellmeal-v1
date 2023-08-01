require 'doorkeeper/grape/helpers'
module V1
  module Resources
    class Menus < Grape::API
      helpers Doorkeeper::Grape::Helpers
      before do
        doorkeeper_authorize!
      end

      before do
        @current_user ||= User.find(doorkeeper_token[:resource_owner_id])
        error!('401 Unauthorized', 401) unless @current_user.admin? or @current_user.sup_admin?
      end
      resources :menus do
        desc 'get all the menus'
        get do
          menus=Menu.all
          present menus, with: V1::Entities::Menu
        end

        desc 'get menu by date'
        route_param :meal_date do
          get do
            menus=Menu.find_by(meal_date: params[:meal_date])
            present menus, with: V1::Entities::Menu
          end
        end
      end
    end
  end
end
