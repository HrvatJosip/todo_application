class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :task
      t.boolean :is_complete

      t.timestamps null: false
    end
  end
end
