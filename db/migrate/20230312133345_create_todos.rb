class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :action, null: false
      t.boolean :completed, default: false
      t.datetime :datetime,

      t.timestamps
    end
  end
end
