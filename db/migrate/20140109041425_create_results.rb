class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :task_id
      t.integer :return
      t.string :stdout
      t.integer :runtime
      t.string :of1
      t.string :of2
      t.string :of3
      t.string :of4

      t.timestamps
    end
  end
end
