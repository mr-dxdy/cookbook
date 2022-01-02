class TagsController < ApplicationController
  def index
    tags = current_user.tags.ordered
    render locals: { tags: tags }
  end

  def new
    tag = current_user.tags.build
    render locals: { tag: tag }
  end

  def create
    tag = current_user.tags.build tag_params

    if tag.save
      redirect_to tags_path, notice: "Тег успешно создан"
    else
      render :new, locals: { tag: tag }
    end
  end

  def edit
    tag = current_user.tags.find params[:id]
    render locals: { tag: tag }
  end

  def update
    tag = current_user.tags.find params[:id]

    if tag.update tag_params
      redirect_to tags_path, notice: "Тег успешно обновлен"
    else
      render :edit, locals: { tag: tag }
    end
  end

  def destroy
    tag = current_user.tags.find params[:id]
    tag.destroy

    redirect_to tags_path, notice: "Тег успешно удален"
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :color)
  end
end
