class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.boolean :completed

      t.timestamps
    end
    add_index :tasks, :title, unique: true
  end
end
