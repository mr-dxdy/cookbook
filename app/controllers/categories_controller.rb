class CategoriesController < ApplicationController
  def index
    categories = current_user.categories.ordered
    render locals: { categories: categories }
  end

  def new
    category = current_user.categories.build(color: '#000000')
    render locals: { category:category }
  end

  def create
    category = current_user.categories.build category_params

    if category.save
      redirect_to categories_path, notice: "Категория успешно создана"
    else
      render :new, locals: { category: category }
    end
  end

  def edit
    category = current_user.categories.find params[:id]
    render locals: { category: category }
  end

  def update
    category = current_user.categories.find params[:id]

    if category.update category_params
      redirect_to categories_path, notice: "Категория успешно обновлена"
    else
      render :edit, locals: { category: category }
    end
  end

  def destroy
    category = current_user.categories.find params[:id]
    category.destroy

    redirect_to categories_path, notice: "Категория успешно удалена"
  end

  private

  def category_params
    params.require(:category).permit(:name, :color)
  end
end
