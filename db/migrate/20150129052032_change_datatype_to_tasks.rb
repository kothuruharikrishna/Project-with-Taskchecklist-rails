class ChangeDatatypeToTasks < ActiveRecord::Migration
  def change
  	change_column :tasks,:name,:text
  end
end
