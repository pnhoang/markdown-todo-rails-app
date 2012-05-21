class ChangeTodoTable < ActiveRecord::Migration
  def up
    change_table :todos do |t|
      t.boolean :completed
      Todo.all.each do |todo|
        if todo.completed_at != nil
          todo.update_attributes! completed: true
        else
          todo.update_attributes! completed: false
        end        
      end
      t.remove :completed_at
    end
  end

  def down
    change_table :todos do |t|
      t.date :completed_at
      Todo.all.each do |todo|
        if todo.completed == true
          todo.update_attributes! completed_at: todo.updated_at.to_date
        else
          todo.update_attributes! completed_at: nil
        end
      end
      t.remove :completed
    end
    
  end
end
