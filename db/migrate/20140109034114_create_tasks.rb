class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :owner
      t.string :desc
      t.integer :tool_id
      t.integer :configure_id
      t.integer :result_id
      t.string :state

      t.timestamps
    end
  end
end
