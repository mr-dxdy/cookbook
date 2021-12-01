class TagsController < ApplicationController
  def new
    tag = current_user.tags.build context: params[:context]
    render locals: { tag: tag }
  end

  def create
    tag = current_user.tags.build tag_params

    if tag.save
      redirect_to new_dish_path, notice: "Тег успешно создан"
    else
      render :new, locals: { tag: tag }
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :color, :context)
  end
end
