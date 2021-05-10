module RecipesHelper

  def image_preview(recipe)
    if recipe.recipe_image.attached? 
      image_tag recipe.recipe_image.variant(resize: '200x200!').processed
    else
      image_tag("Default_image.png", size: '200x200')
    end
  end

  def full_name(user)
    if user.first_name? && user.last_name?
      "#{user.first_name.capitalize} #{user.last_name.capitalize}"
    else
     user.username.blank? ? user.email.split('@')[0].capitalize : user.username
    end
  end
end
