module V1
  module Entities
    class Dish < Grape::Entity
      expose :id
      expose :name
      expose :ingredients
    end
  end
end
