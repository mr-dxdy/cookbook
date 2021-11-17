class CreateDishes < ActiveRecord::Migration[6.1]
  def change
    create_table :dishes, comment: "Блюда" do |t|
      t.string :name, null: false, comment: "Название"
      t.belongs_to :author, null: false, foreign_key: { to_table: :users }, index: true, comment: 'Автор'
      t.integer :servings_number, null: false, comment: "Количество порций"
      t.integer :cooking_time, null: false, comment: "Время готовки, в минутах"
      t.string :comment, comment: "Примечание"

      t.timestamps
    end
  end
end
