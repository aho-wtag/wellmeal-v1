
module ReviewsHelper
  def display_star_rating(rating)
    # Assuming you have a star emoji representation like '⭐️'
    star_emoji = '⭐'
    full_stars = rating
    empty_stars = 5 - rating

    (star_emoji * full_stars) + ('' * empty_stars)
  end
end
