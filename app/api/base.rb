class Base < Grape::API
  format :json
  prefix :api
  version 'v1', :path

  mount V1::Resources::MealAttendances
  mount V1::Resources::Menus
end