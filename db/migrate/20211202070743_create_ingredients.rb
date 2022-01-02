class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients, comment: 'Игредиенты' do |t|
      t.belongs_to :dish, null: false, foreign_key: true, index: true, comment: 'Блюдо'
      t.belongs_to :product, null: false, foreign_key: true, index: true, comment: 'Продукт'
      t.integer :number, null: false, comment: 'Количество'
      t.integer :unit, null: false, comment: 'Единицы измерения'

      t.timestamps
    end
  end
end
