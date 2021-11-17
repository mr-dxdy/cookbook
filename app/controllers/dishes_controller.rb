class DishesController < ApplicationController
  def new
    dish = current_user.dishes.new
    render locals: { dish: dish }
  end

  def create
    dish = current_user.dishes.new dishe_params

    if dish.save
      redirect_to recipes_path, notice: "Блюдо успешно создано"
    else
      render :new, locals: { dish: dish }
    end
  end

  private

  def dishe_params
    params.require(:dish).permit(
      :name,
      :servings_number,
      :cooking_time,
      :comment
    )
  end
end
