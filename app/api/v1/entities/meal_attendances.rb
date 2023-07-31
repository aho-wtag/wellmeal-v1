module V1
  module Entities
    class MealAttendances < Grape::Entity
      expose :id
      expose :meal_type
      expose :meal_date
      expose :user_id
    end
  end
end
