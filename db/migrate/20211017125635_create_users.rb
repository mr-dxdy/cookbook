class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, comment: 'Пользователи' do |t|
      t.string :email, null: false, index: { unique: true }, comment: 'Почта'

      t.timestamps
    end
  end
end
