class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags, comment: 'Теги' do |t|
      t.string :name, null: false, comment: 'Название'
      t.string :color, null: false, comment: 'Цвет'
      t.belongs_to :author, null: false, foreign_key: { to_table: :users }, index: true, comment: 'Автор'

      t.timestamps
    end

    create_table :tag_links, comment: 'Ссылки на теги' do |t|
      t.references(
        :target,
        polymorphic: true,
        null: false,
        comment: 'Ссылка на сущность. Полиморфная связь'
      )
      t.belongs_to :tag, null: false, comment: 'Ссылка на тег'

      t.timestamps
    end

    add_index :tag_links, %i[target_id tag_id], unique: true
  end
end
