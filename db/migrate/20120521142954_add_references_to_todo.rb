class AddReferencesToTodo < ActiveRecord::Migration
  def change
    change_table :todos do |t|
      t.references :list
    end
  end
end
