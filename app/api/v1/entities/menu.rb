module V1
  module Entities
    class Menu < Grape::Entity
      expose :id
      expose :meal_type
      expose :meal_date
      expose :user_id
      expose :dish, using: V1::Entities::Dish
    end
  end
end
