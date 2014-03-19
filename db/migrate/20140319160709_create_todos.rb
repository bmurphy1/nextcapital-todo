class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.references :user
      t.string :description
      t.boolean :is_complete, :default => false
    end
  end
end
