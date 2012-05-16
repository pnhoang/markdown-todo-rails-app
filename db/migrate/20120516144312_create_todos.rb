class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :item
      t.date :completed_at

      t.timestamps
    end
  end
end
