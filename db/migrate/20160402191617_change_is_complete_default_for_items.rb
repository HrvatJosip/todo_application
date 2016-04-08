class ChangeIsCompleteDefaultForItems < ActiveRecord::Migration
  def change
  	change_column_default :items, :is_complete, false
  end
end
