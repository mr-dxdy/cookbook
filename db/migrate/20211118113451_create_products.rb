class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products, comment: 'Продукты' do |t|
      t.string :name, null: false, comment: 'Название'
      t.belongs_to :author, null: false, foreign_key: { to_table: :users }, index: true, comment: 'Автор'

      t.timestamps
    end
  end
end
