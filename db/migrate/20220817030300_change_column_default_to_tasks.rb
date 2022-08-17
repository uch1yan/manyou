class ChangeColumnDefaultToTasks < ActiveRecord::Migration[6.1]
  def change 
    change_column_default :tasks, :deadline, from: "10days", to: true
  end
end
