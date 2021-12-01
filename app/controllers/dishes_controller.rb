class DishesController < ApplicationController
  def new
    dish = current_user.dishes.new
    render locals: { dish: dish, tags: tags_resource }
  end

  def create
    dish = current_user.dishes.new dishe_params

    if dish.save
      redirect_to recipes_path, notice: "Блюдо успешно создано"
    else
      render :new, locals: { dish: dish, tags: tags_resource }
    end
  end

  def edit
    dish = current_user.dishes.find params[:id]
    render locals: { dish: dish, tags: tags_resource }
  end

  def update
    dish = current_user.dishes.find params[:id]

    if dish.update dishe_params
      redirect_to recipes_path, notice: "Блюдо успешно обновлено"
    else
      render :edit, locals: { dish: dish, tags: tags_resource }
    end
  end

  private

  def tags_resource
    @tags_resource ||= Tag.dishes.ordered
  end

  def dishe_params
    params.require(:dish).permit(
      :name,
      :servings_number,
      :cooking_time,
      :comment,
      tag_ids: []
    )
  end
end
