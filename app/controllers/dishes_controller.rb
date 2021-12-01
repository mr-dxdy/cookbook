class DishesController < ApplicationController
  def index
    dishes = current_user.dishes.includes(:tags)
    grouped_dishes = dishes.each_with_object(Hash.new(SortedSet.new)) do |dish, hash|
      dish.tags.each { |tag| hash[tag] |= [dish] }
      hash
    end

    render locals: { grouped_dishes: grouped_dishes }
  end

  def new
    dish = current_user.dishes.new
    render locals: { dish: dish, tags: tags_resource }
  end

  def create
    dish = current_user.dishes.new dishe_params

    if dish.save
      redirect_to dishes_path, notice: "Блюдо успешно создано"
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
      redirect_to dishes_path, notice: "Блюдо успешно обновлено"
    else
      render :edit, locals: { dish: dish, tags: tags_resource }
    end
  end

  def destroy
    dish = current_user.dishes.find params[:id]
    dish.destroy

    redirect_to dishes_path, notice: 'Блюдо успешно удалено'
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
