class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title 
      t.text :content 
      # t.string :deadline 
      # t.integer :priority 
      # t.string :status 

      t.timestamps
    end
  end
end
