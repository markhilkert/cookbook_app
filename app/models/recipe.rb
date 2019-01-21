class Recipe < ApplicationRecord
  def ingredients_list
    ingredients.split(", ")
  end

  def directions_list
    directions.split(", ")
  end

  def friendly_created_at
    created_at.strftime("%b %d, %Y")
  end

  def friendly_updated_at
    updated_at.strftime("%b %d, %Y")
  end

  def friendly_prep_time
    # input: integer, stored in prep_time attribute, with reader method. Ex: 125
    # output: string - "2 Hours, 5 minutes."

    # Find hours within prep_time, by dividing by 60
    # Find minutes within prep_time, by finding the remainder
    # Build a message, using the hours and minutes
      # Only build hours part of the message if there are more than 0 hours

    hours = prep_time / 60
    minutes = prep_time % 60
    time_message = ""

      time_message += "#{hours} #{'Hour'.pluralize(hours)}" if hours > 0
      time_message += ", " if hours > 0 && minutes > 0 
      time_message += "#{minutes} #{"Minute".pluralize(minutes)}" if minutes > 0

    time_message
  end
end
